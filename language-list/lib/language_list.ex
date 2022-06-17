defmodule LanguageList do
  def new(), do: []
  def add(list, language), do: [language | list]
  def remove([_ | tail]), do: tail
  def first([head | _]), do: head
  defdelegate count(list), to: Enum, as: :count

  @spec functional_list?(Enum) :: boolean
  def functional_list?(list), do: "Elixir" in list
end
