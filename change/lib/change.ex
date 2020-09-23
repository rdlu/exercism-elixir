defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns {:error, "cannot change"} if it is not possible to compute the
    right amount of coins. Otherwise returns the tuple {:ok, list_of_coins}

    ## Examples

      iex> Change.generate([5, 10, 15], 3)
      {:error, "cannot change"}

      iex> Change.generate([1, 5, 10], 18)
      {:ok, [1, 1, 1, 5, 10]}

  """

  @spec generate(list, integer) :: {:ok, list} | {:error, String.t()}
  def generate(_, 0), do: {:ok, []}
  def generate(_, target) when target < 0, do: {:error, "cannot change"}
  def generate(coins, target) do
    best_candidate = Enum.find_value(1..(div(target, Enum.min(coins)) + 1),
      fn i -> find_combinations_sum(coins, i, target) end)

    if best_candidate do
      {:ok, best_candidate}
    else
      {:error, "cannot change"}
    end
  end

  @spec find_combinations_sum(list, integer, integer) :: list | nil
  def find_combinations_sum(coins, chunk_size, target) do
    Enum.find(combination_with_repetition(coins, chunk_size),
      fn candidate -> Enum.sum(candidate) == target end)
  end


  @spec combination_with_repetition(list, integer) :: list
  def combination_with_repetition(_, 0), do: [[]]
  def combination_with_repetition([], _), do: []
  def combination_with_repetition([h|t]=s, n) do
    (for l <- combination_with_repetition(s, n-1), do: [h|l]) ++ combination_with_repetition(t, n)
  end
end
