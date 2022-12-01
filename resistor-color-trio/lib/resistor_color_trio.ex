defmodule ResistorColorTrio do
  @colors %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @doc """
  Calculate the resistance value in ohm or kiloohm from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms}
  def label(colors) do
    {multiplier, unit} = do_multiplier(colors)

    {value(colors) * multiplier, unit}
  end

  @spec value(colors :: [atom]) :: integer
  defp value(colors) do
    colors
    |> Enum.take(2)
    |> Enum.map(&code/1)
    |> Integer.undigits()
  end

  @spec do_multiplier(colors :: [atom]) :: {integer, atom}
  defp do_multiplier(colors) do
    exp = code(List.last(colors))

    if exp >= 2 do
      {10 ** (exp - 3), :kiloohms}
    else
      {10 ** exp, :ohms}
    end
  end

  @spec code(atom) :: integer()
  defp code(color) when is_map_key(@colors, color), do: @colors[color]
end
