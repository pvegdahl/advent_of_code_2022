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

  test "Turn a matrix of boxes into stacks of boxes" do
    assert Day05.stack_boxes([[nil, "A", nil], [nil, "B", "C"], ["D", "E", "F"]]) == [
             ~w(D),
             ~w(A B E),
             ~w(C F)
           ]
  end
end
