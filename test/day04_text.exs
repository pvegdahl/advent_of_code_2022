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
end
