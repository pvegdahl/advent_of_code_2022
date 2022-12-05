defmodule Day05 do
  def parse_line(_line) do
    []
  end

  def parse_box_line(line) do
    split_line_into_boxes(line)
    |> Enum.map(&whitespace_to_nil/1)
  end

  def split_line_into_boxes(""), do: []

  def split_line_into_boxes(line) do
    {head, tail} = String.split_at(line, 4)
    [String.at(head, 1) | split_line_into_boxes(tail)]
  end

  def whitespace_to_nil(" "), do: nil
  def whitespace_to_nil(x), do: x

  def stack_boxes(box_matrix) do
    reversed_matrix = Enum.reverse(box_matrix)
    size = hd(reversed_matrix) |> Enum.count()
    stack_boxes(reversed_matrix, List.duplicate([], size))
  end

  defp stack_boxes([], stacks_so_far), do: stacks_so_far

  defp stack_boxes([head | tail], stacks_so_far) do
    stack_boxes(tail, process_one_level(head, stacks_so_far))
  end

  defp process_one_level([], _), do: []

  defp process_one_level([nil | box_tail], [stack_head | stack_tail]) do
    [stack_head | process_one_level(box_tail, stack_tail)]
  end

  defp process_one_level([box_head | box_tail], [stack_head | stack_tail]) do
    [[box_head | stack_head] | process_one_level(box_tail, stack_tail)]
  end

  def move_box(stacks, {from, to}) do
    box_to_move = Enum.at(stacks, from-1) |> List.first()

    for {stack, index} <- Enum.with_index(stacks, 1) do
      calc_new_stack(stack, box_to_move, index, from, to)
    end
  end

  defp calc_new_stack([_head | tail], _box, from, from, _to), do: tail
  defp calc_new_stack(stack, box, to, _from, to), do: [box | stack]
  defp calc_new_stack(stack, _box, _index, _from, _to), do: stack

  def part_a() do
    # File.stream!("puzzle_input/day05.txt", [:utf8])
    # |> Stream.map(&String.trim/1)
  end

  def part_b() do
    # File.stream!("puzzle_input/day05.txt", [:utf8])
    # |> Stream.map(&String.trim/1)
  end
end

# IO.puts("Part A: #{Day05.part_a()}")
# IO.puts("Part B: #{Day05.part_b()}")
