defmodule Day06Test do
  use ExUnit.Case

  test "find first position with 4 distinct characters" do
    assert Day06.packet_begin_position("abcdefg") == 4
    assert Day06.packet_begin_position("aacdefg") == 5
    assert Day06.packet_begin_position("abccefg") == 7
  end

  test "Part A examples" do
    assert Day06.packet_begin_position("mjqjpqmgbljsphdztnvjfqwrcgsmlb") == 7
    assert Day06.packet_begin_position("bvwbjplbgvbhsrlpgdmjqwftvncz") == 5
    assert Day06.packet_begin_position("nppdvjthqldpwncqszvftbrmjlhg") == 6
    assert Day06.packet_begin_position("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg") == 10
    assert Day06.packet_begin_position("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw") == 11
  end
end
