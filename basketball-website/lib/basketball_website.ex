defmodule BasketballWebsite do
  @spec extract_from_path(nil | maybe_improper_list | map, bitstring()) :: any
  def extract_from_path(data, path) when is_bitstring(path) do
    if String.contains?(path, ".") do
      do_extract_from_path(data, String.split(path, "."))
    else
      data[path]
    end
  end

  defp do_extract_from_path(data, [head | tail]) when tail == [] do
    data[head]
  end

  defp do_extract_from_path(data, [head | tail]) do
    do_extract_from_path(data[head], tail)
  end

  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end
