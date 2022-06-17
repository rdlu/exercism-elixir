defmodule Darts do
  require Logger
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    cond do
      distance_from_center(x, y) <= 1 -> 10
      distance_from_center(x, y) <= 5 -> 5
      distance_from_center(x, y) <= 10 -> 1
      true -> 0
    end
  end

  defp distance_from_center(x, y) do
    :math.sqrt(x**2 + y**2)
  end
end
