defmodule CliTest do
  use ExUnit.Case

  @in_file "test.txt"
  @out_file "test_encoded.txt"

  setup do
    File.open(@in_file, [:write], fn(f) ->
      IO.binwrite(f, "My name is Radek\nI like 2 code")
    end)

    on_exit fn ->
      File.rm(@in_file)
      File.rm(@out_file)
    end
  end

  test "Cli.main() runs the code" do
    Cli.main(["--in", @in_file, "--out", @out_file])
    assert File.read(@out_file) == {:ok, "B|A1B/A1|1A|B|1/2|3/1A1|1A|A2|1|A1A\n2/1A2|2|A1A|1/2C/A1A1|C|A2|1\n"}
  end
end
