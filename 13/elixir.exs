defmodule Solution do
  @spec roman_to_int(s :: String.t()) :: integer
  def roman_to_int(s) do
    chars = s |> String.split("", trim: true)

    map = %{
      "I" => 1,
      "V" => 5,
      "X" => 10,
      "L" => 50,
      "C" => 100,
      "D" => 500,
      "M" => 1000
    }

    for i <- 0..(length(chars) - 1) do
      # right to left, so index from back
      reverse_i = length(chars) - 1 - i

      current = map[chars |> Enum.at(reverse_i)]
      last = map[chars |> Enum.at(reverse_i + 1)]

      if current < last && last != nil do
        0 - current
      else
        current
      end
    end
    |> Enum.sum()
  end
end
