defmodule ResourceguruTest do
  use ExUnit.Case
  doctest Resourceguru

  test "flattens the empty list" do
    assert Resourceguru.flatten([]) == []
  end

  test "flattens the nested empty lists" do
    assert Resourceguru.flatten([[[]]]) == []
  end

  test "flattens the lists with one element" do
    assert Resourceguru.flatten([1]) == [1]
  end

  test "flattens the lists with one nested element" do
    assert Resourceguru.flatten([[1]]) == [1]
  end

  test "flattens the array of integers" do
    assert Resourceguru.flatten([1, [2, [3]], 4]) == [1, 2, 3, 4]
  end
end
