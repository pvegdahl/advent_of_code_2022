defmodule Day06Test do
  use ExUnit.Case

  test "find first position with 4 distinct characters" do
    assert Day06.packet_begin_position("abcdefg") == 4
  end
end
