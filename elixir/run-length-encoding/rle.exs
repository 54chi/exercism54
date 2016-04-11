defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """

 def count_chunks(c, acc) do
    count = Enum.count(c)
    |> Integer.to_string

    first_letter= List.first(c)
    "#{acc}#{count}#{first_letter}"
  end

  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.codepoints
    |> Enum.chunk_by(&(&1)) #divide it in chunks of repeating characters
    |> Enum.reduce("", fn(c, acc) -> count_chunks(c, acc) end)
  end

  def print_chunks(c, acc) do
    #get the number of letters
    chunked=c
    |> String.replace(~r/\d+/,"\\0 \\1")
    |> String.split
    letters=String.duplicate(List.last(chunked),String.to_integer(List.first(chunked)))
    "#{acc}#{letters}"
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    #\d+ identifies all numbers in a regex
    #\d+[A-Z] will split in #s followed by any letter
    string
    |> String.replace(~r/\d+[A-Z]/,"\\0 ")
    |> String.split
    |> Enum.reduce("", fn(c, acc) -> print_chunks(c, acc) end)
  end
end
