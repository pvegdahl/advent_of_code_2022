defmodule Day04 do
  def parse_line(line) do
    String.split(line, ",")
    |> Stream.map(&String.split(&1, "-"))
    |> Enum.map(fn [first, last] -> String.to_integer(first)..String.to_integer(last) end)
    |> List.to_tuple()
  end

  def one_range_is_a_subset_of_other?(same, same), do: true

  def one_range_is_a_subset_of_other?(start1..end1, start2..end2)
      when start1 <= start2 and end1 >= end2 do
    true
  end

  def one_range_is_a_subset_of_other?(start1..end1, start2..end2)
      when start1 >= start2 and end1 <= end2 do
    true
  end

  def one_range_is_a_subset_of_other?(_, _), do: false

  def count_subsets(lines) do
    Stream.map(lines, &parse_line/1)
    |> Stream.map(fn {range1, range2} -> one_range_is_a_subset_of_other?(range1, range2) end)
    |> Enum.count(& &1)
  end

  def part_a() do
    File.stream!("puzzle_input/day04.txt", [:utf8])
    |> Stream.map(&String.trim/1)
    |> count_subsets()
  end

  def count_overlaps(lines) do
    Stream.map(lines, &parse_line/1)
    |> Stream.map(fn {range1, range2} -> Range.disjoint?(range1, range2) end)
    |> Enum.count(&(not &1))
  end

  def part_b() do
    File.stream!("puzzle_input/day04.txt", [:utf8])
    |> Stream.map(&String.trim/1)
    |> count_overlaps()
  end
end

IO.puts("Part A: #{Day04.part_a()}")
IO.puts("Part B: #{Day04.part_b()}")
