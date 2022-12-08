defmodule Day07Test do
  use ExUnit.Case

  test "Parse a cd instruction" do
    assert Day07.parse_line("$ cd q") == {:cd, "q"}
    assert Day07.parse_line("$ cd longer_name") == {:cd, "longer_name"}
  end

  test "Parse an ls instruction" do
    assert Day07.parse_line("$ ls") == {:ls}
  end

  test "Parse a file result" do
    assert Day07.parse_line("123 file.name") == {:file, "file.name", 123}
  end

  test "Parse a directory result" do
    assert Day07.parse_line("dir abc") == {:dir, "abc"}
  end

  test "group cd instructions kept basically the same" do
    assert Day07.group_instructions_with_results([{:cd, "a"}]) == [cd: "a"]
    assert Day07.group_instructions_with_results([{:cd, "a"}, {:cd, "b"}]) == [cd: "a", cd: "b"]
  end

  def example_input() do
    [
      "$ cd /",
      "$ ls",
      "dir a",
      "14848514 b.txt",
      "8504156 c.dat",
      "dir d",
      "$ cd a",
      "$ ls",
      "dir e",
      "29116 f",
      "2557 g",
      "62596 h.lst",
      "$ cd e",
      "$ ls",
      "584 i",
      "$ cd ..",
      "$ cd ..",
      "$ cd d",
      "$ ls",
      "4060174 j",
      "8033020 d.log",
      "5626152 d.ext",
      "7214296 k",
    ]
  end
end
