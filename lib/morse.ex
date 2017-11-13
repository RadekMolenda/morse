defmodule Morse do
  @moduledoc """
  encodes given string to morse code. Also obfuscate the morse code
  """

  @keys [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "0",
    ",",
    ".",
  ]

  @encoded_keys [
    ".-",
    "-...",
    "-.-.",
    "-..",
    ".",
    "..-.",
    "--.",
    "....",
    "..",
    ".---",
    "-.-",
    ".-..",
    "--",
    "-.",
    "---",
    ".--.",
    "--.-",
    ".-.",
    "...",
    "-",
    "..-",
    "...-",
    ".--",
    "-..-",
    "-.--",
    "--..",
    ".----",
    "..---",
    "...--",
    "....-",
    ".....",
    "-....",
    "--...",
    "---..",
    "----.",
    "-----",
    "--..--",
    ".-.-.-"
  ]

  @to_morse Enum.zip(@keys, @encoded_keys) |> Enum.into(%{})

  @doc """
  encodes the text.

  ## Examples

      iex> Morse.encode("")
      ""
      iex> Morse.encode("I AM IN TROUBLE")
      "../.-|--/..|-./-|.-.|---|..-|-...|.-..|."


  It also removes the characters it doesn't know
  and allows non capital letters

      iex> Morse.encode("$$i am in trouble$$ 12")
      "../.-|--/..|-./-|.-.|---|..-|-...|.-..|./.----|..---"
  """
  def encode(""), do: ""
  def encode(str), do: process(str, fn(x) -> x end)

  @doc """
  encodes the text to morse and obfuscates.

  ## Examples

      iex> Morse.obfuscate("")
      ""
      iex> Morse.obfuscate("I AM IN TROUBLE")
      "2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1"
  """
  def obfuscate(""), do: ""
  def obfuscate(str), do: process(str, &Obfuscate.encode/1)

  defp process(str, fun) do
    str
    |> String.upcase
    |> String.split(" ")
    |> Enum.map(&(encode_word(&1, fun)))
    |> Enum.join("/")
  end

  defp encode_word(word, fun) do
    word
    |> String.split("", trim: true)
    |> Enum.map(&(&1 |> encode_char |> fun.()))
    |> Enum.filter(&present?/1)
    |> Enum.join("|")

  end

  defp present?(""), do: false
  defp present?(_), do: true

  defp encode_char(c) when c in @keys, do: @to_morse[c]
  defp encode_char(_), do: ""
end
