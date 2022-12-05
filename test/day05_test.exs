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

  test "Move a box from one stack to another" do
    assert Day05.move_box([~w(A B), ~w(C D)], {1, 2}) == [~w(B), ~w(A C D)]
    assert Day05.move_box([~w(A B), ~w(C D), []], {1, 3}) == [~w(B), ~w(C D), ~w(A)]
  end

  test "parse instruction to tuple list" do
    assert Day05.parse_instruction("move 1 from 2 to 1") == [{2, 1}]
  end

  test "parse instruction with muliples to tuple list" do
    assert Day05.parse_instruction("move 3 from 8 to 6") == [{8, 6}, {8, 6}, {8, 6}]
  end
end
