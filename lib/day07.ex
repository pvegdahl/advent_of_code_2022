defmodule Day07 do
  def parse_line(line) do
    [leading_whitespace, spec] = String.trim_trailing(line) |> String.split("- ")
    depth = String.length(leading_whitespace) |> div(2)
    [dir_name | _] = String.split(spec, " ")
    {:dir, dir_name, depth}
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
