defmodule Solution do
  @spec climb_stairs(n :: integer) :: integer
  def climb_stairs(0), do: 1
  def climb_stairs(1), do: 1

  def climb_stairs(n) do
    0..n |> Enum.reduce([], &possibilities(&1, &2, n))
  end

  def possibilities(e, acc, _) when e <= 1, do: [1 | acc]
  def possibilities(e, acc, n) when e == n, do: Enum.at(acc, 0) + Enum.at(acc, 1)
  def possibilities(e, acc, n), do: [Enum.at(acc, 0) + Enum.at(acc, 1) | acc]
end
