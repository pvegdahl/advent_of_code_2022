defmodule Day07 do
  def parse_line(line) do
    dir_name = String.trim_leading(line) |> String.at(2)
    {:dir, dir_name}
  end

  def part_a() do
    # File.stream!("puzzle_input/day07.txt", [:utf8])
    # |> Stream.map(&String.trim/1)
  end

  def part_b() do
    # File.stream!("puzzle_input/day07.txt", [:utf8])
    # |> Stream.map(&String.trim/1)
  end
end

IO.puts("Part A: #{Day07.part_a()}")
IO.puts("Part B: #{Day07.part_b()}")
