defmodule Day09 do
  def parse_line(line) do
    parts = String.split(line, " ")
    number = parts |> Enum.at(1) |> String.to_integer()
    direction = parts |> Enum.at(0) |> direction_string_to_atom()

    {direction, number}
  end

  defp direction_string_to_atom("R"), do: :right
  defp direction_string_to_atom("L"), do: :left
  defp direction_string_to_atom("U"), do: :up
  defp direction_string_to_atom("D"), do: :down

  def part_a() do
    # File.stream!("puzzle_input/day09.txt", [:utf8])
    # |> Stream.map(&String.trim/1)
  end

  def part_b() do
    # File.stream!("puzzle_input/day09.txt", [:utf8])
    # |> Stream.map(&String.trim/1)
  end
end

IO.puts("Part A: #{Day09.part_a()}")
IO.puts("Part B: #{Day09.part_b()}")
