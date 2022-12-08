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
             %{
               ["/"] => [{:file, "one.txt", 24601}, {:dir, "some_dir"}],
               ["some_dir", "/"] => [{:file, "two.txt", 321}]
             }
  end

  test "Use cd .. correctly when building the tree" do
    assert Day07.build_filesystem_tree(
             cd: "/",
             ls: [{:dir, "roger"}, {:dir, "lawrence"}],
             cd: "roger",
             ls: [{:file, "roger.txt", 20_180_109}],
             cd: "..",
             cd: "lawrence",
             ls: [{:file, "lawrence.txt", 20_200_515}]
           ) ==
             %{
               ["/"] => [{:dir, "roger"}, {:dir, "lawrence"}],
               ["roger", "/"] => [{:file, "roger.txt", 20_180_109}],
               ["lawrence", "/"] => [{:file, "lawrence.txt", 20_200_515}]
             }
  end

  test "get total sizes of a path" do
    assert Day07.path_size(test_filesystem_tree(), ["roger", "/"]) == 4
    assert Day07.path_size(test_filesystem_tree(), ["lawrence", "/"]) == 3
    assert Day07.path_size(test_filesystem_tree(), ["/"]) == 41
  end

  defp test_filesystem_tree() do
    %{
      ["/"] => [{:dir, "roger"}, {:dir, "lawrence"}, {:file, "ann", 34}],
      ["roger", "/"] => [{:file, "roger.txt", 4}],
      ["lawrence", "/"] => [{:file, "lawrence.txt", 2}, {:file, "emmanual", 1}]
    }
  end

  test "get sizes of all directories" do
    assert Day07.all_path_sizes(test_filesystem_tree()) == %{
             ["roger", "/"] => 4,
             ["lawrence", "/"] => 3,
             ["/"] => 41
           }
  end

  test "Sum all dirs of at most X" do
    assert Day07.sum_all_dirs_at_most_size_x(test_filesystem_tree(), 10) == 7
  end

  test "Part A example input" do
    assert Day07.part_a_impl(example_input()) == 95437
  end

  test "get required space" do
    assert Day07.get_required_space(example_filesystem_tree()) == 8_381_165
  end

  test "get smallest dir size to delete" do
    assert Day07.smallest_dir_to_delete(example_filesystem_tree()) == 24_933_642
  end

  test "Part B example input" do
    assert Day07.part_b_impl(example_input()) == 24_933_642
  end

  defp example_input() do
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

  defp example_filesystem_tree() do
    example_input() |> Day07.input_to_filesystem_tree()
  end
end
