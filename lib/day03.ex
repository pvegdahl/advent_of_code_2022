defmodule Day03 do

  def half_lines(line), do: String.split_at(line, div(String.length(line), 2))

  def common_character(string_a, string_b) do
    mapset_a = String.codepoints(string_a) |> MapSet.new()
    mapset_b = String.codepoints(string_b) |> MapSet.new()
    MapSet.intersection(mapset_a, mapset_b)
    |> MapSet.to_list()
    |> List.first()
  end

  def letter_to_priority(letter) do
    String.to_charlist(letter)
    |> List.first()
    |> then(&(&1 - case_offset(letter)))
  end

  defp case_offset(letter) when letter >= "a", do: 96
  defp case_offset(_letter), do: 38

  def line_priority(line) do
    half_lines(line)
    |> then(fn {a, b} -> common_character(a, b) end)
    |> letter_to_priority()
  end

  def lines_to_priority_sum(lines) do
    Enum.map(lines, &line_priority/1)
    |> Enum.sum()
  end

  def part_a() do
    File.stream!("puzzle_input/day03.txt", [:utf8])
    |> lines_to_priority_sum()
  end

  def part_b() do
    # File.stream!("puzzle_input/day03.txt", [:utf8])
  end
end

IO.puts("Part A: #{Day03.part_a()}")
# IO.puts("Part B: #{Day03.part_b()}")
