defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    for top <- tops,
        bottom <- bottoms,
        map_dif(top, bottom, :base_color) &&
          map_comb_max(top, bottom, Keyword.get(options, :maximum_price, 100)) do
      {top, bottom}
    end
  end

  defp map_dif(map1, map2, property) do
    Map.get(map1, property) != Map.get(map2, property)
  end

  defp map_comb_max(map1, map2, max) do
    Map.get(map1, :price) + Map.get(map2, :price) <= max
  end
end
