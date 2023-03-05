defmodule Solution do
  def reduction_function(x, stack, map) do
    case Map.get(map, x) do
      nil ->
        [x | stack]

      opening ->
        if Enum.at(stack, 0) == opening do
          stack |> Enum.drop(1)
        else
          [x | stack]
        end
    end
  end

  @spec is_valid(s :: String.t()) :: boolean
  def is_valid(s) do
    map = %{
      ")" => "(",
      "]" => "[",
      "}" => "{"
    }

    s
    |> String.graphemes()
    |> Enum.reduce([], &reduction_function(&1, &2, map))
    |> Enum.empty?()
  end
end
