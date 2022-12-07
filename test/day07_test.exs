defmodule Day07Test do
  use ExUnit.Case

  test "Parse a dir from a line" do
    assert Day07.parse_line("- q (dir)") == {:dir, "q"}
  end

  test "Parse a nested dir from a line" do
    assert Day07.parse_line("  - x (dir)") == {:dir, "x"}
  end
end
