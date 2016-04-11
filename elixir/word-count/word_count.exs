defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """

  def update_count(word, map) do
    Map.update(map, word, 1, &(&1 + 1))
  end

  @spec count(String.t) :: map()
  def count(sentence) do
    words = sentence
    |> String.downcase
    |> String.replace( ~r/(_|[^\w\p{Pd}])/u, " ") #mega regex :p
    |> String.split
    Enum.reduce(words, Map.new(), fn(w, m) -> update_count(w, m) end)
  end
end
