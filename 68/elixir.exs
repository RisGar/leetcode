defmodule Solution do
  @spec my_sqrt(x :: integer) :: integer
  def my_sqrt(x) do
    # Max value of x = 2^(31) - 1
    # my_sqrt(2^(31) - 1) = 46340
    1..46340 |> Enum.take_while(&(&1 * &1 <= x)) |> List.last()
  end
end
