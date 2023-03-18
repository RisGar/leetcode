# defmodule ListNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           next: ListNode.t() | nil
#         }
#   defstruct val: 0, next: nil
# end

defmodule Solution do
  def get_numbers(%ListNode{val: val, next: next}, num_string \\ "") do
    if next != nil do
      get_numbers(next, Integer.to_string(val) <> num_string)
    else
      (Integer.to_string(val) <> num_string)
      |> String.to_integer()
    end
  end

  def make_list(array, list \\ nil) do
    if array != [] do
      make_list(tl(array), %ListNode{val: String.to_integer(hd(array)), next: list})
    else
      list
    end
  end

  @spec add_two_numbers(l1 :: ListNode.t() | nil, l2 :: ListNode.t() | nil) :: ListNode.t() | nil
  def add_two_numbers(l1, l2) do
    (get_numbers(l1) + get_numbers(l2))
    |> Integer.to_string()
    |> String.graphemes()
    |> make_list()
  end
end
