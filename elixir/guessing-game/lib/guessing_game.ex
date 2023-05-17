defmodule GuessingGame do

  def compare(_secret_number), do: "Make a guess"
  def compare(secret_number, guess) when (is_integer(guess) === false), do: "Make a guess"
  def compare(secret_number, guess) when secret_number === guess, do: "Correct"
  def compare(secret_number, guess) when (guess + 1) === secret_number, do: "So close"
  def compare(secret_number, guess) when (guess - 1) === secret_number, do: "So close"
  def compare(secret_number, guess) when guess > secret_number, do: "Too high"
  def compare(secret_number, guess) when guess < secret_number, do: "Too low"


end
