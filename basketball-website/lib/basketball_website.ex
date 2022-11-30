defmodule BasketballWebsite do
  def extract_from_path(data, path) when is_bitstring(path) do
    if String.contains?(path, ".") do
      extract_from_path(data, String.split(path, "."))
    else
      data[path]
    end
  end

  def extract_from_path(data, [head | tail]) when tail == [] do
    data[head]
  end

  def extract_from_path(data, [head | tail]) do
    extract_from_path(data[head], tail)
  end

  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end
