defmodule Secrets do
  def secret_add(secret), do: fn p -> p + secret end

  def secret_subtract(secret), do: &(&1 - secret)

  def secret_multiply(secret), do: fn p -> p * secret end

  def secret_divide(secret), do: &(div &1, secret)

  def secret_and(secret), do: fn p -> Bitwise.band(p, secret) end

  def secret_xor(secret), do: &(Bitwise.bxor &1, secret)

  def secret_combine(secret_function1, secret_function2) do
    fn p -> p |> secret_function1.() |> secret_function2.() end
  end
end
