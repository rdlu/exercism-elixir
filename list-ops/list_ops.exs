defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(list) do
    reduce(list, 0, fn _dont_care, acc -> acc + 1 end)
  end

  @spec reverse(list) :: list
  def reverse([]), do: []
  def reverse(list) do
    reduce(list, [], fn current_list,new_list -> [current_list|new_list] end)
  end

  @spec map(list, (any -> any)) :: list
  def map([], _f), do: []
  def map([h | t], f) do
    [ f.(h) | map(t, f) ]
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(list, f) do
    reverse(list) |> reduce([], fn cur,new -> if f.(cur), do: [cur | new], else: new end)
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _), do: acc
  def reduce([h | t], acc, f) do
    reduce(t, f.(h, acc), f)
  end

  @spec append(list, list) :: list
  def append(l, []), do: l
  def append([], l), do: l
  def append([h | t], b) do
    [h | append(t,b)]
  end

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([h | t]) do
    append(h, concat(t))
  end
end