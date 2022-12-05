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
    size = List.first(reversed_matrix) |> Enum.count()
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

  def move_box(boxes, {_from, _to, 0}), do: boxes

  def move_box(boxes, {from, to, count}) do
    box_to_move = Enum.at(boxes, from - 1) |> List.first()

    for {stack, index} <- Enum.with_index(boxes, 1) do
      calc_new_stack(stack, box_to_move, index, from, to)
    end
    |> move_box({from, to, count - 1})
  end

  defp calc_new_stack([_head | tail], _box, from, from, _to), do: tail
  defp calc_new_stack(stack, box, to, _from, to), do: [box | stack]
  defp calc_new_stack(stack, _box, _index, _from, _to), do: stack

  defp move_many_boxes(boxes, instructions) do
    Enum.reduce(instructions, boxes, &move_box(&2, &1))
  end

  def parse_instruction(instruction) do
    captures =
      Regex.named_captures(~r/move (?<count>\d+) from (?<from>\d+) to (?<to>\d+)/, instruction)

    from = Map.get(captures, "from") |> String.to_integer()
    to = Map.get(captures, "to") |> String.to_integer()
    count = Map.get(captures, "count") |> String.to_integer()
    {from, to, count}
  end

  def parse_all_instructions(instructions), do: Enum.map(instructions, &parse_instruction/1)

  def split_input_lines(lines) do
    {
      Enum.filter(lines, &String.contains?(&1, "[")),
      Enum.filter(lines, &String.starts_with?(&1, "move"))
    }
  end

  def top_boxes(boxes) do
    Enum.map(boxes, &List.first/1)
    |> Enum.join()
  end

  def part_a_impl(lines) do
    {box_input, instruction_input} = split_input_lines(lines)

    instructions = parse_all_instructions(instruction_input)
    boxes = Enum.map(box_input, &parse_box_line/1) |> stack_boxes()

    move_many_boxes(boxes, instructions) |> top_boxes()
  end

  def part_a() do
    File.stream!("puzzle_input/day05.txt", [:utf8])
    |> Enum.map(&String.trim(&1, "\n"))
    |> part_a_impl()
  end

  def part_b() do
    # File.stream!("puzzle_input/day05.txt", [:utf8])
    # |> Stream.map(&String.trim/1)
  end
end

IO.puts("Part A: #{Day05.part_a()}")
# IO.puts("Part B: #{Day05.part_b()}")
