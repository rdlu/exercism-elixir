defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """
  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _key), do: :not_found
  def search(numbers, key), do: search(numbers, key, 0, tuple_size(numbers))

  defp search(numbers, key, min, max) do
    middle = div(min + max, 2)
    value = elem(numbers, middle)
    cond do
      value == key -> {:ok, middle}
      middle == max or middle == min -> :not_found
      value < key -> search(numbers, key, middle + 1, max)
      value > key -> search(numbers, key, min, middle - 1)
    end
  end
end
