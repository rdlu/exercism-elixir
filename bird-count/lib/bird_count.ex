defmodule BirdCount do
  def today([]), do: nil
  def today([first | _days]), do: first

  def increment_day_count([]), do: [1]
  def increment_day_count([first | days]), do: [first+1 | days]

  def has_day_without_birds?(list \\ []), do: 0 in list

  def total(list \\ []), do: Enum.sum(list)
  # Using delegate example
  # defdelegate total(list), to: Enum, as: :sum

  def busy_days(list \\ []), do: Enum.count(list, &(&1 >= 5))
end
