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
