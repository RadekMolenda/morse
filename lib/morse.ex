defmodule Morse do
  @moduledoc """
  encodes, or obfuscates the morse code
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
    "?",
    ";",
    ":",
    "/",
    "-",
    "'",
    "(",
    "_",
    "@"
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
    ".-.-.-",
    "..--..",
    "-.-.-",
    "---...",
    "-..-.",
    "-....-",
    ".----.",
    "'-.--.-",
    "..--.-",
    ".--.-."
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
  def encode(str) do
    str
    |> String.upcase
    |> String.split(" ")
    |> Enum.map_join("/", &(encode_word(&1)))
  end

  defp encode_word(word) do
    word
    |> String.split("", trim: true)
    |> Enum.map(&(encode_char(&1)))
    |> Enum.filter(&(present?(&1)))
    |> Enum.join("|")
  end

  defp present?(""), do: false
  defp present?(_), do: true

  defp encode_char(c) when c in @keys, do: @to_morse[c]
  defp encode_char(_), do: ""
end
