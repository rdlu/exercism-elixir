defmodule Lasagna do
  def expected_minutes_in_oven, do: 40

  def remaining_minutes_in_oven(elapsed) do
    expected_minutes_in_oven() - elapsed
  end

  def preparation_time_in_minutes(layers) do
    layers * 2
  end

  def total_time_in_minutes(layers, elapsed) do
    preparation_time_in_minutes(layers) + elapsed
  end

  def alarm do
    "Ding!"
  end
end
