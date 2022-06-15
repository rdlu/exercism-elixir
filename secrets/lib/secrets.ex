defmodule Secrets do
  def secret_add(secret), do: fn p -> p + secret end

  def secret_subtract(secret), do: fn p -> p - secret end

  def secret_multiply(secret), do: fn p -> p * secret end

  def secret_divide(secret), do: fn p -> div(p, secret) end

  def secret_and(secret), do: fn p -> Bitwise.band(p, secret) end

  def secret_xor(secret), do: fn p -> Bitwise.bxor(p, secret) end

  def secret_combine(secret_function1, secret_function2) do
    fn p -> secret_function2.(secret_function1.(p)) end
  end
end
