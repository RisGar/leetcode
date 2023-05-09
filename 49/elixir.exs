defmodule Solution do
  @spec group_anagrams(strs :: [String.t]) :: [[String.t]]
  def group_anagrams(strs) do
    strs
    |> Enum.group_by(&String.to_charlist(&1) |> Enum.frequencies())
    |> Map.values()
  end
end
