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

  test "Part A example input" do
    assert Day03.lines_to_priority_sum(example_input()) == 157
  end

  defp example_input() do
    [
      "vJrwpWtwJgWrhcsFMMfFFhFp",
      "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
      "PmmdzqPrVvPwwTWBwg",
      "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
      "ttgJtRGJQctTZtZT",
      "CrZsJsPPZsGzwwsLwLmpwMDw",
    ]
  end

  test "Group lines into 3-lists" do
    assert Day03.group_by_3(~w(a b c d e f)) == [~w(a b c), ~w(d e f)]
  end

  test "Find common element in a group" do
    assert Day03.common_element(["abc", "bcd", "cde"]) == "c"
  end

  test "Example imput 3B" do
    assert Day03.group_priority_sum(example_input()) == 70
  end

end
