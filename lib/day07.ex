defmodule Day07 do
  def parse_line(line) do
    case String.split(line, " ") do
      ["$", "cd", dir_name] -> {:cd, dir_name}
      ["$", "ls"] -> {:ls}
      ["dir", dir_name] -> {:dir, dir_name}
      [file_size, file_name] -> {:file, file_name, String.to_integer(file_size)}
    end
  end

  def group_instructions_with_results([{:ls} | tail]) do
    [ls: tail]
  end
  def group_instructions_with_results(parsed_lines) do
    parsed_lines
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
