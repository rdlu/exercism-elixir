defmodule Teenager do
  def hey(input) do
    cond do
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
    str |> String.strip === ""
  end
end