defmodule Day09Test do
  use ExUnit.Case

  test "parse line to instruction tuple" do
    assert Day09.parse_line("R 1") == {:right, 1}
    assert Day09.parse_line("R 2") == {:right, 2}
  end
end
