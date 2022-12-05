defmodule Day04 do
  def parse_line(line) do
    String.split(line, ",")
    |> Stream.map(&String.split(&1, "-"))
    |> Enum.map(fn [first, last] -> String.to_integer(first)..String.to_integer(last) end)
    |> List.to_tuple()
  end

  def one_range_is_a_subset_of_other(same, same), do: true

  def one_range_is_a_subset_of_other(start1..end1, start2..end2)
      when start1 <= start2 and end1 >= end2 do
    true
  end

  def one_range_is_a_subset_of_other(start1..end1, start2..end2)
      when start1 >= start2 and end1 <= end2 do
    true
  end

  def one_range_is_a_subset_of_other(_, _), do: false

  def part_a() do
    # File.stream!("puzzle_input/day04.txt", [:utf8])
    # |> Stream.map(&String.trim/1)
  end

  def part_b() do
    # File.stream!("puzzle_input/day04.txt", [:utf8])
    # |> Stream.map(&String.trim/1)
  end
end

# IO.puts("Part A: #{Day04.part_a()}")
# IO.puts("Part B: #{Day04.part_b()}")
