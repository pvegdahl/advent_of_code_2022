defmodule Day04Test do
  use ExUnit.Case

  test "parse line into range pair" do
    assert Day04.parse_line("2-4,6-8") == {2..4, 6..8}
  end
end
