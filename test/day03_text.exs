defmodule Day03Test do
  use ExUnit.Case

  test "Split a line of test in half" do
    assert Day03.half_lines("abcdef") == {"abc", "def"}
  end

  test "Find the common character in two strings" do
    assert Day03.common_character("abcde", "efghi") == "e"
  end

  test "Convert letter (string) to priority" do
    assert Day03.letter_to_priority("a") == 1
    assert Day03.letter_to_priority("z") == 26
    assert Day03.letter_to_priority("A") == 27
    assert Day03.letter_to_priority("Z") == 52
  end

  test "Line priority" do
    assert Day03.line_priority("abcdezyxwe") == 5
  end

end
