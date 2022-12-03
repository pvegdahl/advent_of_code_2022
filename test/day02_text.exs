defmodule Day02Test do
  use ExUnit.Case

  test "letters are parsed into correct rps" do
    assert Day02.letter_to_rpc("A") == :rock
    assert Day02.letter_to_rpc("B") == :paper
    assert Day02.letter_to_rpc("C") == :scissors

    assert Day02.letter_to_rpc("X") == :rock
    assert Day02.letter_to_rpc("Y") == :paper
    assert Day02.letter_to_rpc("Z") == :scissors
    end

  test "parse a line into a rps tuple" do
    assert Day02.parse_line("A Z") == {:rock, :scissors}
    assert Day02.parse_line("B Y") == {:paper, :paper}
    assert Day02.parse_line("C X") == {:scissors, :rock}
  end

  test "record the correct game result" do
    assert Day02.rps_result({:rock, :rock}) == :tie
    assert Day02.rps_result({:scissors, :scissors}) == :tie
    assert Day02.rps_result({:paper, :paper}) == :tie

    assert Day02.rps_result({:rock, :scissors}) == :loss
    assert Day02.rps_result({:scissors, :paper}) == :loss
    assert Day02.rps_result({:paper, :rock}) == :loss

    assert Day02.rps_result({:scissors, :rock}) == :win
    assert Day02.rps_result({:paper, :scissors}) == :win
    assert Day02.rps_result({:rock, :paper}) == :win
  end

  test "win/loss/tie to points" do
    assert Day02.rps_result_to_points(:win) == 6
    assert Day02.rps_result_to_points(:tie) == 3
    assert Day02.rps_result_to_points(:loss) == 0
  end

  test "throw type to points" do
    assert Day02.rps_throw_to_points(:rock) == 1
    assert Day02.rps_throw_to_points(:paper) == 2
    assert Day02.rps_throw_to_points(:scissors) == 3
  end

  test "One game to points" do
    assert Day02.game_points({:paper, :rock}) == 1
    assert Day02.game_points({:scissors, :paper}) == 2
    assert Day02.game_points({:rock, :scissors}) == 3

    assert Day02.game_points({:rock, :rock}) == 4
    assert Day02.game_points({:paper, :paper}) == 5
    assert Day02.game_points({:scissors, :scissors}) == 6

    assert Day02.game_points({:scissors, :rock}) == 7
    assert Day02.game_points({:rock, :paper}) == 8
    assert Day02.game_points({:paper, :scissors}) == 9
  end

end
