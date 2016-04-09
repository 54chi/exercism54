defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  def get_first(x,acc) do
     String.first(x) <> acc
  end

  def abbreviate(words) when is_list(words) do
    #String.upcase(string)
    Enum.reduce(words,"", &get_first/2)
    |> String.reverse
  end

  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
   string
   |> String.replace( ~r/[,-]/, " ")
   |> String.replace( ~r/([a-z])([A-Z])/, "\\1 \\2")  #split HyperText under the assumption that there is a lowercase before
   |> String.split
   |> abbreviate
   |> String.upcase
  end
end
