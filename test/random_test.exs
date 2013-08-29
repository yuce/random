defmodule RandomTest do
  use ExUnit.Case

  test "the truth" do
    assert(true)
  end

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

end
