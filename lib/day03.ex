defmodule Day03 do
  def parse_line(line) do
    []
  end

  def half_lines(line), do: String.split_at(line, div(String.length(line), 2))

  def common_character(string_a, string_b) do
    mapset_a = String.codepoints(string_a) |> MapSet.new()
    mapset_b = String.codepoints(string_b) |> MapSet.new()
    MapSet.intersection(mapset_a, mapset_b)
    |> MapSet.to_list()
    |> List.first()
  end



  def part_a() do
    # File.stream!("puzzle_input/day03.txt", [:utf8])
  end

  def part_b() do
    # File.stream!("puzzle_input/day03.txt", [:utf8])
  end
end

# IO.puts("Part A: #{Day03.part_a()}")
# IO.puts("Part B: #{Day03.part_b()}")
