defmodule ResistorColorDuo do
  @colors %{black: 0, brown: 1, red: 2, orange: 3, yellow: 4, green: 5,
            blue: 6, violet: 7, grey: 8, white: 9}

  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value(colors) do
    colors
    |> Enum.take(2)
    |> Enum.map(&code/1)
    |> Integer.undigits
  end

  @spec code(atom) :: integer()
  defp code(color) when is_map_key(@colors, color), do: @colors[color]
end
