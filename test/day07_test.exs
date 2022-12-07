defmodule Day07Test do
  use ExUnit.Case

  test "Parse a dir from a line" do
    assert Day07.parse_line("- q (dir)") == {:dir, "q"}
  end
end
