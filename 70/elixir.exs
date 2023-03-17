defmodule Solution do
  @spec climb_stairs(n :: integer) :: integer
  def climb_stairs(n) do
    0..n
    |> Enum.reduce([], fn e, acc ->
      # n = 0 or 1 won't work in with the case statement, because there are not yet two elements in the enum
      if n <= 1 do
        1
      else
        case e do
          x when x <= 1 ->
            [1 | acc]

          # return only solution when n is reached
          x when x == n ->
            Enum.at(acc, 0) + Enum.at(acc, 1)

          _ ->
            [Enum.at(acc, 0) + Enum.at(acc, 1) | acc]
        end
      end
    end)
  end
end

Solution.climb_stairs(3) |> IO.inspect()
