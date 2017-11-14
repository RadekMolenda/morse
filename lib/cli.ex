defmodule Cli do
  def main(args) do
    case args |> parse_args do
      [in: in_file, out: out_file] ->
        {:ok, out} = File.open out_file, [:write]
        File.stream!(in_file)
        |> Stream.map(&(String.replace(&1, "\n", "")))
        |> Enum.each(fn(line) ->
          IO.binwrite(out, Morse.obfuscate(line))
          IO.binwrite(out, "\n")
        end)

      _ -> IO.puts "usage: ./resourceguru --in input_file --out output_file"
    end
  end

  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args,
      switches: [in: :string, out: :string]
    )
    options
  end
end
