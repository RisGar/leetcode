defmodule Solution do
  @spec is_palindrome(x :: integer) :: boolean
  def is_palindrome(x) when x < 0 do
    false
  end

  def is_palindrome(x) do
    Integer.digits(x) == Integer.digits(x) |> Enum.reverse()
  end
end
