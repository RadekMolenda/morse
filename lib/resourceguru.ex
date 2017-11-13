defmodule Resourceguru do
  @moduledoc """
  module that flattens the array
  """

  @doc """
  flattens the list.

  ## Examples

      iex> Resourceguru.flatten([])
      []
      iex> Resourceguru.flatten([1])
      [1]
      iex> Resourceguru.flatten([1, [2, [3]], 4])
      [1, 2, 3, 4]

  """
  def flatten(list), do: flatten(list, []) |> Enum.reverse
  def flatten([[] | t], acc), do: flatten(t, acc)
  def flatten([h | t], acc) when is_list(h), do: flatten(t, flatten(h, acc))
  def flatten([h | t], acc), do: flatten(t, [h | acc])
  def flatten([], acc), do: acc
end
