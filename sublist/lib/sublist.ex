defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b -> :equal
      length(a) < length(b) and sublist?(a,b) -> :sublist
      length(a) > length(b) and sublist?(b,a) -> :superlist
      true -> :unequal
    end
  end

  def sublist?([],_), do: true
  def sublist?(sublist,full_list) do
      #First idea: sublist === Enum.take(full_list, length(sublist)) or sublist?(sublist,tl(full_list))
      #But it timeouts, Stream.chunk seems more lazy!
      Stream.chunk_every(full_list, length(sublist), 1, :discard)
        |> Enum.find(fn chunk -> sublist === chunk end)
  end
end
