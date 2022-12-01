defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    datetime
    |> Time.compare(~T[12:00:00]) == :lt
  end

  def return_date(checkout_datetime) do
    days_to_add =
      if before_noon?(checkout_datetime) do
        28
      else
        29
      end

    NaiveDateTime.to_date(checkout_datetime)
    |> Date.add(days_to_add)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    days = Date.diff(actual_return_datetime, planned_return_date)

    if days < 0, do: 0, else: days
  end

  def monday?(datetime) do
    Date.day_of_week(datetime) == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_date = checkout |> datetime_from_string()
    return_date = return |> datetime_from_string()
    planned_return = checkout_date |> return_date()
    discounted_rate = return_date |> discounted_rate(rate)

    trunc(days_late(planned_return, return_date) * discounted_rate)
  end

  defp discounted_rate(return_date, rate),
    do: if(return_date |> monday?(), do: rate * 0.5, else: rate)
end
