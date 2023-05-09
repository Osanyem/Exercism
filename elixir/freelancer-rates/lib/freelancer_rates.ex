defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    discount_amount = discount / 100 |>  Kernel.*(before_discount)
    before_discount - discount_amount
  end

  def monthly_rate(hourly_rate, discount) do
    daily_rate(hourly_rate) |> apply_discount(discount)|> Kernel.*(22) |> ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_cost = daily_rate(hourly_rate) |> apply_discount(discount)
    budget / daily_cost |> Float.floor(1)
  end
end
