defmodule Solution do
  @spec generate(num_rows :: integer) :: [[integer]]
  def generate(num_rows) do
    0..(num_rows - 1)
    |> Enum.reduce([], &generate_row/2)
    |> Enum.reverse()
  end

  defp generate_row(row, acc),
    do: [0..row |> Enum.reduce([], &generate_value(&1, &2, row, acc)) | acc]

  defp generate_value(i, acc_row, row, _) when i == 0 or i == row, do: [1 | acc_row]

  defp generate_value(i, acc_row, row, [last_row | _]) do
    if(i <= Float.ceil(row / 2),
      do: [Enum.at(last_row, i - 1) + Enum.at(last_row, i) | acc_row],
      # mirror values in the second half by finding the index of the correct value in the reversed list
      else: [Enum.at(acc_row, -row - (1 - 2 * i)) | acc_row]
    )
  end
end
