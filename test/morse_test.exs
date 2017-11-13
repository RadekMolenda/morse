defmodule MorseTest do
  use ExUnit.Case
  doctest Morse

  test "Morse.obfuscate(\"hello\") obfuscates the string to \"4|1|1A2|1A2|C\"" do
    assert Morse.obfuscate("hello") == "4|1|1A2|1A2|C"

  end
end
