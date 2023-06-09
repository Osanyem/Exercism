defmodule Secrets do
  def secret_add(secret) do
    &(&1 + secret)
  end

  def secret_subtract(secret) do
    &(&1 - secret)
  end

  def secret_multiply(secret) do
    # fn x -> x * secret end
    &(&1 * secret)
  end

  def secret_divide(secret) do
    # fn x -> div(x, secret) end
    &(div(&1, secret))
  end

  def secret_and(secret) do
    &(Bitwise.band(&1, secret))
  end

  def secret_xor(secret) do
    &(Bitwise.bxor(&1, secret))
  end

  def secret_combine(secret_function1, secret_function2) do
    # fn x -> secret_function1.(x) |> secret_function2.() end
    &(secret_function1.(&1) |> secret_function2.())
  end
end
