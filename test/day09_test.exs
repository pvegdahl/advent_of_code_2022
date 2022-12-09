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
end
