defmodule Solution do
  @spec is_valid_sudoku(board :: [[char]]) :: boolean
  def is_valid_sudoku(board) do
    valid_row?(board) and valid_column?(board) and valid_block?(board)
  end

  def valid_row?(board) do
    board
    |> Enum.map(&valid_array?/1)
    |> Enum.all?()
  end

  def valid_column?(board) do
    board
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(&valid_array?/1)
    |> Enum.all?()
  end

  def valid_block?(board) do
    board
    |> Enum.map(&Enum.chunk_every(&1, 3))
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(&Enum.chunk_every(&1, 3))
    |> List.flatten()
    |> Enum.chunk_every(9)
    |> Enum.map(&valid_array?/1)
    |> Enum.all?()
  end

  def valid_array?(array) do
    # 46 is the ASCII code for '.'
    filtered = Enum.filter(array, fn x -> x != 46 end)
    filtered == Enum.uniq(filtered)
  end
end
