defmodule Day03Test do
  use ExUnit.Case

  test "Split a line of test in half" do
    assert Day03.half_lines("abcdef") == {"abc", "def"}
  end

end
