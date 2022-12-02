defmodule Day01 do
  def parse_input(path) do
    File.stream!(path, [:utf8])
    |> Stream.map(&String.trim/1)
    |> Stream.map(&to_int_or_nil/1)
    |> Enum.into([])
  end

  def to_int_or_nil(x) do
    case Integer.parse(x) do
      :error -> nil
      {num, _} -> num
    end
  end

  def to_list_of_lists([], final_list), do: Enum.reverse(final_list)
  def to_list_of_lists(input_list, []), do: to_list_of_lists(input_list, [[]])
  def to_list_of_lists([nil | tail], list_so_far), do: to_list_of_lists(tail, [[] | list_so_far])
  def to_list_of_lists([input_head | input_tail], [result_head | result_tail]) do
    to_list_of_lists(input_tail, [[input_head | result_head] | result_tail])
  end

  def part_a() do
    parse_input("puzzle_input/day01.txt")
    |> to_list_of_lists([])
    |> Stream.map(&Enum.sum/1)
    |> Enum.max()
  end

  def part_b() do
    parse_input("puzzle_input/day01.txt")
    |> to_list_of_lists([])
    |> Stream.map(&Enum.sum/1)
    |> Enum.sort(:desc)
    |> Stream.take(3)
    |> Enum.sum()
  end
end