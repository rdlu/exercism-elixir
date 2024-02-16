defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    target_price = Keyword.get(options, :maximum_price, 100)

    for top <- tops,
        bottom <- bottoms,
        top.base_color != bottom.base_color &&
          top.price + bottom.price <= target_price do
      {top, bottom}
    end
  end
end
