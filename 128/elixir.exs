defmodule Solution do
  @spec longest_consecutive(nums :: [integer]) :: integer
  def longest_consecutive(nums) do
    nums
    |> Enum.sort()
    |> Enum.uniq()
    |> longest_consecutive2()
  end

  @spec longest_consecutive2(nums :: [integer]) :: integer
  def longest_consecutive2([]), do: 0
  def longest_consecutive2(nums) when length(nums) == 1, do: 1

  def longest_consecutive2(nums = [_ | tail]) do
    nums
    |> Enum.zip(tail)
    |> Enum.scan(1, &if(elem(&1, 1) == elem(&1, 0) + 1, do: &2 + 1, else: 1))
    |> Enum.max()
  end
end
