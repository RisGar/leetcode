defmodule Solution do
  @spec two_sum(nums :: [integer], target :: integer) :: [integer]
  def two_sum(nums, target) do
    indices = 0..(length(nums) - 1)

    map = nums |> Stream.zip(indices) |> Enum.into(%{})

    for i <- indices do
      e = nums |> Enum.at(i)

      if Map.has_key?(map, target - e) and map[target - e] != i do
        [i, map[target - e]]
      end
    end
    |> Enum.filter(& &1)
    |> Enum.at(0)
  end
end

Solution.two_sum([3, 2, 4], 6)
|> IO.inspect()
