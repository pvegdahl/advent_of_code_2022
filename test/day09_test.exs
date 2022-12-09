defmodule Day09Test do
  use ExUnit.Case

  test "parse line to instruction tuple" do
    assert Day09.parse_line("R 1") == {:right, 1}
    assert Day09.parse_line("R 2") == {:right, 2}
    assert Day09.parse_line("L 3") == {:left, 3}
    assert Day09.parse_line("U 4") == {:up, 4}
    assert Day09.parse_line("D 5") == {:down, 5}
  end
end
