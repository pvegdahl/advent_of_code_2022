defmodule Day05Test do
  use ExUnit.Case

  test "Parse a simple line of boxes" do
    assert Day05.parse_box_line("[A] [B] [C]") == ~w(A B C)
  end

  test "Parse a line of boxes with empties" do
    assert Day05.parse_box_line("[A] [B]    ") == ["A", "B", nil]
    assert Day05.parse_box_line("    [B] [C]") == [nil, "B", "C"]
    assert Day05.parse_box_line("[A]     [C]") == ["A", nil, "C"]
  end
end
