defmodule Day07Test do
  use ExUnit.Case

  test "Parse a cd instruction" do
    assert Day07.parse_line("$ cd q") == {:cd, "q"}
    assert Day07.parse_line("$ cd longer_name") == {:cd, "longer_name"}
  end

  test "Parse an ls instruction" do
    assert Day07.parse_line("$ ls") == :ls
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

  test "group ls instructions grouped with results" do
    assert Day07.group_instructions_with_results([:ls, {:file, "thing.txt", 24601}]) == [
             ls: [{:file, "thing.txt", 24601}]
           ]

    assert Day07.group_instructions_with_results([:ls, {:file, "one.txt", 24601}, {:dir, "two"}]) ==
             [ls: [{:file, "one.txt", 24601}, {:dir, "two"}]]

    assert Day07.group_instructions_with_results([
             :ls,
             {:file, "one.txt", 24601},
             :ls,
             {:dir, "two"}
           ]) == [ls: [{:file, "one.txt", 24601}], ls: [{:dir, "two"}]]
  end

  test "group a list with cd and ls instructions" do
    assert Day07.group_instructions_with_results([
             {:cd, "a"},
             :ls,
             {:file, "one.txt", 24601},
             {:cd, "b"},
             :ls,
             {:dir, "two"}
           ]) ==
             [cd: "a", ls: [{:file, "one.txt", 24601}], cd: "b", ls: [{:dir, "two"}]]
  end

  test "Build the the filesystem tree" do
    assert Day07.build_filesystem_tree(
             cd: "/",
             ls: [{:file, "one.txt", 24601}, {:dir, "some_dir"}],
             cd: "some_dir",
             ls: [{:file, "two.txt", 321}]
           ) ==
             %{["/"] => [{:file, "one.txt", 24601}, {:dir, "some_dir"}], ["some_dir", "/"] => [{:file, "two.txt", 321}]}
  end

  test "Use cd .. correctly when building the tree" do
    assert Day07.build_filesystem_tree(
             cd: "/",
             ls: [{:dir, "roger"}, {:dir, "lawrence"}],
             cd: "roger",
             ls: [{:file, "roger.txt", 20180109}],
             cd: "..",
             cd: "lawrence",
             ls: [{:file, "lawrence.txt", 20200515}],
           ) ==
             %{["/"] => [{:dir, "roger"}, {:dir, "lawrence"}], ["roger", "/"] => [{:file, "roger.txt", 20180109}], ["lawrence", "/"] => [{:file, "lawrence.txt", 20200515}]}
  end

  test "get total sizes of a path" do
    filesystem_tree = %{["/"] => [{:dir, "roger"}, {:dir, "lawrence"}, {:file, "ann", 34}], ["roger", "/"] => [{:file, "roger.txt", 4}], ["lawrence", "/"] => [{:file, "lawrence.txt", 2}, {:file, "emmanual", 1}]}

    assert Day07.path_size(filesystem_tree, ["roger", "/"]) == 4
    assert Day07.path_size(filesystem_tree, ["lawrence", "/"]) == 3
    assert Day07.path_size(filesystem_tree, ["/"]) == 41

    # assert Day07.total_size_by_dir(%{["/"] => [{:dir, "roger"}, {:dir, "lawrence"}], ["roger", "/"] => [{:file, "roger.txt", 4}], ["lawrence", "/"] => [{:file, "lawrence.txt", 2}]}) ==
    #   %{["/"] => 6, ["roger", "/"] => 4, ["lawrence", "/"] => 2}
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
      "7214296 k"
    ]
  end
end
