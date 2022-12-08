defmodule Day07 do
  def parse_line(line) do
    case String.split(line, " ") do
      ["$", "cd", dir_name] -> {:cd, dir_name}
      ["$", "ls"] -> :ls
      ["dir", dir_name] -> {:dir, dir_name}
      [file_size, file_name] -> {:file, file_name, String.to_integer(file_size)}
    end
  end

  def group_instructions_with_results([]), do: []

  def group_instructions_with_results([:ls | tail]) do
    [
      {:ls, Enum.take_while(tail, &ls_result?/1)}
      | group_instructions_with_results(Enum.drop_while(tail, &ls_result?/1))
    ]
  end

  def group_instructions_with_results([{:cd, _dir_name} = cd_instruction | tail]) do
    [cd_instruction | group_instructions_with_results(tail)]
  end

  def ls_result?({:file, _, _}), do: true
  def ls_result?({:dir, _}), do: true
  def ls_result?(_), do: false

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
