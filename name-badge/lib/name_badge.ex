defmodule NameBadge do
  def print(id, name, department) do
    "#{id(id)}#{name} - #{depart(department)}"
  end

  defp id(nil), do: ""
  defp id(id), do: "[#{id}] - "

  defp depart(s) do
    if s do
      s |> String.upcase()
    else
      "OWNER"
    end
  end
end
