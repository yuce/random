defmodule Random do
  use Bitwise

  @nv_magicconst 4 * :math.exp(-0.5) / :math.sqrt(2.0)
  @twopi 2 * :math.pi
  @bpf 53
  @maxwidth 1 <<< @bpf

  defexception ValueError, message: "ValueError", can_rety: false do
    def full_message(self), do: "ValueError: #{self.message}" 
  end

  def randrange(stop) do
    randrange(0, stop, 1)
  end

  def randrange(start, stop) do
    randrange(start, stop, 1)
  end

  def randrange(start, _stop, _step)
    when trunc(start) != start do
    throw ValueError[message: "non-integer start for randrange(#{start}, #{_stop}, #{_step}"]
  end

  def randrange(_start, stop, _step)
    when trunc(stop) != stop do
    throw ValueError[message: "non-integer stop for randrange(#{_start}, #{stop}, #{_step}"]
  end

  def randrange(_start, _stop, step)
    when trunc(step) != step do
    throw ValueError[message: "non-integer step for randrange(#{_start}, #{_stop}, #{step}"]
  end

  def randrange(_start, _stop, step)
    when step == 0 do
    throw ValueError[message: "zero step for randrange(#{_start}, #{_stop}, #{step}"]
  end

  def randrange(start, stop, step)
    when step == 1 do
    width = stop - start
    if width > 0 do
      if width >= @maxwidth do
        trunc(start + randbelow(width))
      else
        trunc(start + trunc(:random.uniform * width))
      end
    else
      throw ValueError[message: "empty range for randrange(#{start}, #{stop}, #{step}"]
    end
  end

  def randrange(start, stop, step) do
    width = stop - start
    n = cond do
      step > 0 ->
        trunc((width + step - 1) / step)
      step < 0 ->
        trunc((width + step + 1) / step)
      true ->
        throw ValueError[message: "zero step for randrange(#{start}, #{stop}, #{step}"]
    end

    if n <= 0 do
      throw ValueError[message: "empty range for randrange(#{start}, #{stop}, #{step})"]
    end

    if n >= @maxwidth do
      start + step * randbelow(n)
    else
      start + step * trunc(:random.uniform * n)
    end
  end

  defp randbelow(n) do
    trunc(:random.uniform * n)
  end

  def choice(seq) do
    Enum.at(seq, trunc(:random.uniform * Enum.count(seq)))
  end

  def randint(a, b), do: randrange(a, b + 1)
  def shuffle(x), do: Enum.shuffle(x)
  def uniform(a, b), do: a + (b - a) * :random.uniform
  def random, do: :random.uniform

  def normalvariate(mu, sigma) do
    z = normalvariate_helper
    mu + z * sigma
  end
  
  defp normalvariate_helper do
    u1 = :random.uniform
    u2 = 1.0 - :random.uniform
    z = @nv_magicconst * (u1 - 0.5) / u2
    zz = z * z / 4.0

    if zz <= -:math.log(u2), do: z, else: normalvariate_helper
  end

  def lognormvariate(mu, sigma), do: :math.exp(normalvariate(mu, sigma))
  def expovariate(lambda), do: -:math.log(1.0 - :random.uniform) / lambda

  def vonmisesvariate(_mu, kappa)
    when kappa <= 1.0e-6, do: @twopi * :random.uniform

  def vonmisesvariate(mu, kappa) do
    s = 0.5 / kappa
    r = s + :math.sqrt(1.0 + s * s)
    z = vonmisesvariate_helper(r)
    q = 1.0 / r
    f = (q + z) / (1.0 + q * z)
    u3 = :random.uniform

    if u3 > 0.5 do
      mod((mu + :math.acos(f)), @twopi)
    else
      mod((mu - :math.acos(f)), @twopi)
    end

  end

  defp vonmisesvariate_helper(r) do
    u1 = :random.uniform
    z = :math.cos(:math.pi * u1)
    d = z / (r + 2)
    u2 = :random.uniform

    if (u2 < 1.0 - d * d) or (u2 <= (1.0 - d) * :math.exp(d)) do
      z
    else
      vonmisesvariate_helper(r)
    end
  end

  def mod(x, y), do: rem(rem(x, y) + y, y)


    

    

end
