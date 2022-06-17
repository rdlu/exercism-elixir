defmodule LanguageList do
  def new(), do: []
  def add(list, language), do: [language | list]
  def remove([_to_remove | languages]), do: languages
  def first([language | _]), do: language
  defdelegate count(list), to: Enum, as: :count

  @spec functional_list?(Enum) :: boolean
  def functional_list?(list), do: "Elixir" in list
end
