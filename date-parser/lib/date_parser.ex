defmodule DateParser do
  # it allows day 00, 99, but I was not able to compile a complex one that is passing this specific implementation
  # something like 0[1-9]|[12][0-9]|3[01] is allowing 111
  def day(), do: "\\d{1,2}"

  def month(), do: "\\d{1,2}"

  def year(), do: "\\d{4}"

  def day_names() do
    "(Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday)"
  end

  def month_names() do
    "(January|February|March|April|May|June|July|August|September|October|November|December)"
  end

  def capture_day(), do: "(?<day>#{day()})"
  def capture_month(), do: "(?<month>#{month()})"
  def capture_year(), do: "(?<year>#{year()})"
  def capture_day_name(), do: "(?<day_name>#{day_names()})"
  def capture_month_name(), do: "(?<month_name>#{month_names()})"
  def capture_numeric_date(), do: "#{capture_day()}/#{capture_month()}/#{capture_year()}"
  def capture_month_name_date(), do: "#{capture_month_name()} #{capture_day()}, #{capture_year()}"
  def capture_day_month_name_date(), do: "#{capture_day_name()}, #{capture_month_name_date()}"

  def match_numeric_date(), do: Regex.compile!("^#{capture_numeric_date()}$")
  def match_month_name_date(), do: Regex.compile!("^#{capture_month_name_date()}$")
  def match_day_month_name_date(), do: Regex.compile!("^#{capture_day_month_name_date()}$")
end
