defmodule Cli do
  def main(args) do
    args
    |> parse_args
    |> process
  end

  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args,
      switches: [in: :string, out: :string]
    )
    options
  end

  defp process([in: in_file, out: out_file]) do
    File.open(in_file, [:read])
    |> encode_and_save(out_file)
  end
  defp process(_) do
    IO.puts "Usage: ./resourceguru --in input_file --out output_file"
  end

  defp encode_and_save({:ok, file}, out_file) do
    File.open(out_file, [:write], fn(out_f) ->
      IO.stream(file, :line)
      |> Enum.each(fn(line) ->
        IO.binwrite(out_f, Morse.obfuscate(line))
        IO.binwrite(out_f, "\n")
      end)
    end)
  end
  defp encode_and_save({:error, _}, _) do
    IO.puts "input file must exist"
  end
end
