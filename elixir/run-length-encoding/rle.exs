defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """

  def count(chars) do
    # Either use the enum/map or an each
    Enum.reduce(chars, %{}, &update_count/2)
  end

   def update_count(word, acc) do
       Map.update acc, word, 1, &(&1 + 1)
     end

  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.codepoints
    |> count
  #  |> Enum.join
  end

  @spec decode(String.t) :: String.t
  def decode(string) do

  end
end
