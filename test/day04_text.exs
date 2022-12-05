defmodule Day04Test do
  use ExUnit.Case

  test "parse line into range pair" do
    assert Day04.parse_line("2-4,6-8") == {2..4, 6..8}
    assert Day04.parse_line("23-45,67-890") == {23..45, 67..890}
  end

  test "subset is true for equal ranges" do
    assert Day04.one_range_is_a_subset_of_other(1..4, 1..4)
  end

  test "subset is false for non unified ranges" do
    assert not Day04.one_range_is_a_subset_of_other(1..4, 3..7)
  end

  test "subset is true for second range smaller" do
    assert Day04.one_range_is_a_subset_of_other(1..4, 2..3)
    assert Day04.one_range_is_a_subset_of_other(1..4, 1..3)
    assert Day04.one_range_is_a_subset_of_other(1..4, 2..4)
  end

  test "subset is true for first range smaller" do
    assert Day04.one_range_is_a_subset_of_other(2..3, 1..4)
    assert Day04.one_range_is_a_subset_of_other(1..3, 1..4)
    assert Day04.one_range_is_a_subset_of_other(2..4, 1..4)
  end

  test "Part A example input passes" do
    assert Day04.count_subsets(example_input()) == 2
  end

  defp example_input() do
    ["2-4,6-8", "2-3,4-5", "5-7,7-9", "2-8,3-7", "6-6,4-6", "2-6,4-8"]
  end
end
