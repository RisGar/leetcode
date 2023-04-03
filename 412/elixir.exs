efmodule Solution do
  @spec fizz_buzz(n :: integer) :: [String.t()]
  def fizz_buzz(n) do
    1..n |> Enum.map(&nums/1)
  end

  def nums(n) when rem(n, 3) == 0 and rem(n, 5) == 0, do: "FizzBuzz"
  def nums(n) when rem(n, 3) == 0, do: "Fizz"
  def nums(n) when rem(n, 5) == 0, do: "Buzz"
  def nums(n), do: Integer.to_string(n)
end
