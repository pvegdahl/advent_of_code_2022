defmodule Day05 do
  def parse_line(_line) do
    []
  end

  def parse_box_line(line) do
    String.split(line, " ")
    |> Enum.map(&(String.at(&1, 1)))
  end

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
