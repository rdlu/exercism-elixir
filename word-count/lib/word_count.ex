defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
     |> extract_list
     |> Enum.reduce(%{}, fn word, dict -> Map.update(dict, word, 1, fn x -> x + 1 end) end)
  end

  defp extract_list(sentence) do
    sentence
     |> String.downcase
     |> String.replace(~r([!&@$%^,:.]), "\s")
     |> String.split(~r[\s|_], trim: true)
     |> Enum.map(&trim_quotes/1)
  end

  defp trim_quotes(word) do
    word |> String.trim_leading("'") |> String.trim_trailing("'")
  end
end
