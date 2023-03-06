defmodule Solution do
  @spec convert(s :: String.t(), num_rows :: integer) :: String.t()
  def convert(s, 1) do
    s
  end

  def convert(s, num_rows) do
    chars = String.graphemes(s)

    for i <- 0..(length(chars) - 1) do
      pos = rem(i, num_rows * 2 - 2)

      if pos >= num_rows do
        # return tuple {pos, char}
        {num_rows * 2 - 2 - pos, chars |> Enum.at(i)}
      else
        # return tuple {pos, char}
        {pos, chars |> Enum.at(i)}
      end
    end
    |> Enum.sort_by(&elem(&1, 0))
    |> Enum.map(&elem(&1, 1))
    |> Enum.join("")
  end
end
