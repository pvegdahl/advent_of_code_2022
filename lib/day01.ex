defmodule Day01 do
  def parse_input(path) do
    File.stream!(path, [:utf8])
    |> Stream.map(&String.trim/1)
    |> Stream.map(&Day01.to_int_or_nil/1)
    |> Enum.into([])
  end

  def to_int_or_nil(x) do
    case Integer.parse(x) do
      :error -> nil
      {num, _} -> num
    end
  end

  def to_list_of_lists([], final_list), do: Enum.reverse(final_list)
  def to_list_of_lists(["" | tail], list_so_far), do: to_list_of_lists(tail, [[], list_so_far])
  def to_list_of_lists(input_list, []), do: to_list_of_lists(input_list, [[]])
  def to_list_of_lists([input_head | input_tail], [result_head | result_tail]) do
    to_list_of_lists(input_tail, [[input_head | result_head] | result_tail])
  end
end