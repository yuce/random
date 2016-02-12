defmodule RandomTest do
  use ExUnit.Case

  test "mod == python %" do
    assert(Random.mod(5, 5) == 0)
    assert(Random.mod(5, 1) == 0)
    assert(Random.mod(5, 2) == 1)
    assert(Random.mod(-5, 2) == 1)
    assert(Random.mod(5, -2) == -1)
    assert(Random.mod(-5, -2) == -1)
    assert(Random.mod(100, 17) == 15)
    assert(Random.mod(-100, 17) == 2)
    assert(Random.mod(100, -17) == -2)
    assert(Random.mod(-100, -17) == -15)
  end

  test "randrange start, stop" do
    n = Random.randrange(10, 20)
    assert(n >= 10 and n < 20)

    n = Random.randrange(10, 11)
    assert(n == 10)
  end

  test "randint a, b" do
    n = Random.randint(10, 20)
    assert(n >= 10 and n < 20)

    n = Random.randint(10, 10)
    assert(n == 10)
  end

  test "choice a" do
    ls = [10, 20, 30, 40, 50]
    c = Random.choice(ls)
    assert(Enum.find ls, &(c == &1))

    c = Random.choice(:erlang.list_to_tuple(ls))
    assert(Enum.find ls, &(c == &1))

    seq = 10..50
    c = Random.choice(seq)
    assert(c >= 10 and c <= 50)
  end

  test "sample p, k" do
    sample = Random.sample(0..1000000, 60)
    s = Enum.into(sample, HashSet.new)
    assert(Set.size(s) == 60)

    ls = Enum.map(1..10, &(&1 * 10))

    sample = Random.sample(ls, 2)
    s = Enum.into(sample, HashSet.new)
    assert(Set.size(s) == 2)

    sample = Random.sample(ls, length(ls))
    s = Enum.into(sample, HashSet.new)
    assert(Set.size(s) == length(ls))
  end

  test "triangular l, h, m" do
    r = Random.triangular
    assert(r >= 0 and r < 1)
  end

end
