defmodule Solution do
  @spec roman_to_int(s :: String.t()) :: integer
  def roman_to_int(s) do
    charmap = %{
      "I" => 1,
      "V" => 5,
      "X" => 10,
      "L" => 50,
      "C" => 100,
      "D" => 500,
      "M" => 1000
    }

    chars =
      s
      |> String.split("", trim: true)
      |> Enum.reverse()
      |> Enum.with_index()
      |> Enum.reduce([], &get_vals(&1, charmap, &2))
      |> Enum.sum()
  end

  # last char can't be negative
  def get_vals({e, 0}, charmap, acc), do: [charmap[e] | acc]
  # get last element and compare if it is greater than the current element
  def get_vals({e, i}, charmap, acc = [last | _]), do: [pos_or_neg(charmap[e], last) | acc]

  def pos_or_neg(e_val, last_val) when e_val < last_val, do: -e_val
  def pos_or_neg(e_val, _), do: e_val
end
