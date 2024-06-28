defmodule Solution do
  @spec two_sum(nums :: [integer], target :: integer) :: [integer]
  def two_sum(nums, target) do
    map = nums |> Enum.with_index() |> Enum.into(%{})

    {e, i} =
      nums
      |> Enum.with_index()
      |> Enum.find(fn {e, i} ->
        Map.has_key?(map, target - e) and map[target - e] != i
      end)

    [i, map[target - e]]
  end
end
