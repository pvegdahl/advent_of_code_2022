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

  test "do a series of head, tail moves" do
    assert Day09.move_both(%{head: {0, 0}, tail: {0, 0}}, {1, 0}) == %{head: {1, 0}, tail: {0, 0}}
    assert Day09.move_both(%{head: {1, 0}, tail: {1, 0}}, {1, 0}) == %{head: {2, 0}, tail: {1, 0}}
    assert Day09.move_both(%{head: {1, 0}, tail: {0, 0}}, {1, 0}) == %{head: {2, 0}, tail: {1, 0}}
  end

  test "do repeated moves and record the positions" do
    assert Day09.repeated_move_both(%{head: {0, 0}, tail: {0, 0}}, {{1, 0}, 5}) == {%{head: {5, 0}, tail: {4, 0}}, [{4, 0}, {3, 0}, {2, 0}, {1, 0}, {0, 0}]}
  end

  test "do a list of repeated moves" do
    assert Day09.list_of_moves(%{head: {0, 0}, tail: {0, 0}}, [{{1, 0}, 2}, {{0, -1}, 3}]) == {%{head: {2, -3}, tail: {2, -2}}, [{2, -2}, {2, -1}, {1, 0}, {1, 0}, {0, 0}]}
  end
end
