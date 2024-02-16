defmodule SecretHandshake do
  import Bitwise

  @gestures [
    {1, "wink"},
    {2, "double blink"},
    {4, "close your eyes"},
    {8, "jump"},
    {16, :reverse}
  ]

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) when is_integer(code) do
    @gestures
    |> Enum.reduce([], fn {mask, gesture}, acc -> decode(mask, gesture, code, acc) end)
    |> Enum.reverse()
  end

  defp decode(mask, :reverse, code, acc) when band(mask, code) > 0,
    do: acc |> Enum.reverse()

  defp decode(mask, gesture, code, acc) when band(mask, code) > 0, do: [gesture | acc]
  defp decode(_, _, _, acc), do: acc
end
