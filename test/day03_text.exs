defmodule Day03Test do
  use ExUnit.Case

  test "Split a line of test in half" do
    assert Day03.half_lines("abcdef") == {"abc", "def"}
  end

  test "Find the common character in two strings" do
    assert Day03.common_character("abcde", "efghi") == "e"
  end

end
