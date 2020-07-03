defmodule Bob do
  def hey(input) do
    input = input |> String.trim
    cond do
        question?(input) && yell?(input) -> "Calm down, I know what I'm doing!"
        question?(input) -> "Sure."
        yell?(input) -> "Whoa, chill out!"
        silence?(input) -> "Fine. Be that way!"
        true -> "Whatever."
    end
  end

  def question?(str) do
    str |> String.last == "?"
  end

  def yell?(str) do
    str |> String.upcase === str and str |> String.downcase !== str
  end

  def silence?(str) do
    str === ""
  end
end
