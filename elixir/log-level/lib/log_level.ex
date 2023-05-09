defmodule LogLevel do
  # def to_label(level, legacy?) do
  #   cond do
  #     level == 0 and legacy? == true ->
  #   end
  # end

  def to_label(0, true), do: :unknown
  def to_label(5, true), do: :unknown
  def to_label(0, _legacy?), do: :trace
  def to_label(1, _legacy?), do: :debug
  def to_label(2, _legacy?), do: :info
  def to_label(3, _legacy?), do: :warning
  def to_label(4, _legacy?), do: :error
  def to_label(5, _legacy?), do: :fatal
  def to_label(_, _), do: :unknown

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)
    case {label, legacy?}  do
      {:error, _} -> :ops
      {:fatal, _} -> :ops
      {:unknown, true} -> :dev1
      {:unknown, _} -> :dev2
      {_, _} -> false
    end
  end
end
