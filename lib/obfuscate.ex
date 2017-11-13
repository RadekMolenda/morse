defmodule Obfuscate do
  @moduledoc """
  obfuscates single morse code. Also obfuscate the morse code
  """
  @doc """
  encodes the morse code sign.

  ## Examples
    iex> Obfuscate.encode("---..")
    "C2"
    iex> Obfuscate.encode("")
    ""
    iex> Obfuscate.encode(".....")
    "5"
  """

  def encode(""), do: ""
  def encode("....." <> next), do: "5" <> encode(next)
  def encode("...." <> next), do: "4" <> encode(next)
  def encode("..." <> next), do: "3" <> encode(next)
  def encode(".." <> next), do: "2" <> encode(next)
  def encode("." <> next), do: "1" <> encode(next)
  def encode("-----" <> next), do: "E" <> encode(next)
  def encode("----" <> next), do: "D" <> encode(next)
  def encode("---" <> next), do: "C" <> encode(next)
  def encode("--" <> next), do: "B" <> encode(next)
  def encode("-" <> next), do: "A" <> encode(next)
end
