defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, & &1.price)
  end

  def with_missing_price(inventory) do
    for item <- inventory, is_nil(item.price), do: item
  end

  def update_names(inventory, old_word, new_word) do
    for item <- inventory do
      %{item | name: String.replace(item.name, old_word, new_word)}
    end
  end

  def increase_quantity(item, count) do
    updated =
      for {k, v} <- item.quantity_by_size,
          into: %{},
          do: {k, v + count}

    %{item | quantity_by_size: updated}
  end

  def total_quantity(item) do
    item.quantity_by_size
    |> Map.values()
    |> Enum.sum()
  end
end
