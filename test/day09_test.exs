defmodule Day09Test do
  use ExUnit.Case

  test "parse line to instruction tuple" do
    assert Day09.parse_line("R 1") == {{1, 0}, 1}
    assert Day09.parse_line("R 2") == {{1, 0}, 2}
    assert Day09.parse_line("L 3") == {{-1, 0}, 3}
    assert Day09.parse_line("U 4") == {{0, 1}, 4}
    assert Day09.parse_line("D 5") == {{0, -1}, 5}
  end

  test "update position from vector" do
    assert Day09.update_pos_with_vector({0, 0}, {1, 0}) == {1, 0}
    assert Day09.update_pos_with_vector({0, 0}, {-1, 0}) == {-1, 0}
    assert Day09.update_pos_with_vector({2, 2}, {-1, 0}) == {1, 2}
    assert Day09.update_pos_with_vector({3, -3}, {0, 1}) == {3, -2}
    assert Day09.update_pos_with_vector({3, 5}, {0, -1}) == {3, 4}
  end

  test "don't update the tail position of the rope tail when the head is close" do
    assert Day09.update_rope_tail_from_rope_head({86, 99}, {86, 99}) == {86, 99}
    assert Day09.update_rope_tail_from_rope_head({86, 99}, {86, 100}) == {86, 99}
    assert Day09.update_rope_tail_from_rope_head({86, 99}, {85, 99}) == {86, 99}
    assert Day09.update_rope_tail_from_rope_head({86, 99}, {87, 98}) == {86, 99}
  end

  test "update the tail position of the rope tail when the head is too far away" do
    assert Day09.update_rope_tail_from_rope_head({2, 3}, {4, 3}) == {3, 3}
    assert Day09.update_rope_tail_from_rope_head({2, 3}, {0, 3}) == {1, 3}
    assert Day09.update_rope_tail_from_rope_head({2, 3}, {2, 5}) == {2, 4}
    assert Day09.update_rope_tail_from_rope_head({2, 3}, {2, 1}) == {2, 2}
  end

  test "don't update the tail position for close diagonal cases" do
    assert Day09.update_rope_tail_from_rope_head({2, 3}, {3, 4}) == {2, 3}
    assert Day09.update_rope_tail_from_rope_head({2, 3}, {1, 4}) == {2, 3}
    assert Day09.update_rope_tail_from_rope_head({2, 3}, {1, 2}) == {2, 3}
    assert Day09.update_rope_tail_from_rope_head({2, 3}, {3, 2}) == {2, 3}
  end

  test "update the tail position for diagonal cases" do
    assert Day09.update_rope_tail_from_rope_head({5, 1}, {4, 3}) == {4, 2}
    assert Day09.update_rope_tail_from_rope_head({5, 1}, {3, 2}) == {4, 2}
    assert Day09.update_rope_tail_from_rope_head({5, 1}, {7, 2}) == {6, 2}
    assert Day09.update_rope_tail_from_rope_head({5, 1}, {7, 0}) == {6, 0}
  end

  test "do repeated moves and record the positions" do
    assert Day09.repeated_move_all([{0, 0}, {0, 0}], {{1, 0}, 5}) ==
             {[{5, 0}, {4, 0}], [{4, 0}, {3, 0}, {2, 0}, {1, 0}, {0, 0}]}
  end

  test "do a list of repeated moves" do
    assert Day09.list_of_moves([{{1, 0}, 2}, {{0, -1}, 3}]) ==
             {[{2, -3}, {2, -2}], [{2, -2}, {2, -1}, {1, 0}, {1, 0}, {0, 0}]}
  end

  test "Count unique tail positions from moves" do
    assert Day09.unique_tail_positions_from_moves([{{1, 0}, 2}, {{0, -1}, 3}]) == 4
  end

  test "Part A example input" do
    assert Day09.implementation(example_input_a(), 2) == 13
  end

  defp example_input_a(), do: ["R 4", "U 4", "L 3", "D 1", "R 4", "D 1", "L 5", "R 2"]

  test "Move a 4 part rope" do
    assert Day09.move_multiple_knots([{4, 0}, {3, 0}, {2, 1}, {1, 1}], {1, 0}) == [
             {5, 0},
             {4, 0},
             {3, 0},
             {2, 0}
           ]
  end

  test "Part B example input" do
    assert Day09.implementation(example_input_b(), 10) == 36
  end

  defp example_input_b(), do: ["R 5", "U 8", "L 8", "D 3", "R 17", "D 10", "L 25", "U 20"]
end
