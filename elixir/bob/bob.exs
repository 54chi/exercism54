defmodule Bob do
  def hey(input) do
    cond do
      Regex.match?(~r/[?]$/,input) ->
        "Sure."
      Regex.match?(~r/[A-Z][A-Z0-9]|[А-Я]/,input) ->
        "Whoa, chill out!"
      String.strip(input)==="" ->
        "Fine. Be that way!"
      true ->
        "Whatever."
#        raise "Didn't find a match that worked "<> input

    end
  end
end
