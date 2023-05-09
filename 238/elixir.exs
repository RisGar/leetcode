defmodule Solution do
  @spec product_except_self(nums :: [integer]) :: [integer]
  def product_except_self(nums) when length(nums) == 1, do: nums

  def product_except_self(nums) do
    scan_left =
      nums
      |> List.delete_at(-1)
      |> scanl(1)

    nums
    |> List.delete_at(0)
    |> scanr(1)
    |> Enum.zip_with(scan_left, &(&1 * &2))
  end

  # scan functions from Scala
  def scanl(nums, e) do
    nums
    |> Enum.scan(e, &(&1 * &2))
    |> List.insert_at(0, e)
  end

  def scanr(nums, e) do
    nums
    |> Enum.reverse()
    |> Enum.scan(e, &(&1 * &2))
    |> List.insert_at(0, e)
    |> Enum.reverse()
  end
end
