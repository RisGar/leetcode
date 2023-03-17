defmodule TreeNode do
  @type t :: %__MODULE__{
          val: integer,
          left: TreeNode.t() | nil,
          right: TreeNode.t() | nil
        }
  defstruct val: 0, left: nil, right: nil
end

defmodule Solution do
  @spec has_path_sum(root :: TreeNode.t() | nil, target_sum :: integer) :: boolean
  def has_path_sum(nil, target_sum), do: false

  def has_path_sum(%{left: nil, right: nil, val: val}, target_sum), do: val == target_sum

  def has_path_sum(%{left: left, right: nil, val: val}, target_sum),
    do: has_path_sum(left, target_sum - val)

  def has_path_sum(%{left: nil, right: right, val: val}, target_sum),
    do: has_path_sum(right, target_sum - val)

  def has_path_sum(%{left: left, right: right, val: val}, target_sum),
    do: has_path_sum(left, target_sum - val) or has_path_sum(right, target_sum - val)
end
