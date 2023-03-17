defmodule Solution do
  @spec find_kth_positive(arr :: [integer], k :: integer) :: integer
  def find_kth_positive(arr, k) do
    find_kth_positive(arr, k, 1)
  end

  defp find_kth_positive(arr, k, i, accumulate \\ []) do
    if length(accumulate) < k do
      if List.first(arr) == i do
        find_kth_positive(Enum.drop(arr, 1), k, i + 1, accumulate)
      else
        find_kth_positive(arr, k, i + 1, [i | accumulate])
      end
    else
      accumulate |> List.first()
    end
  end
end
