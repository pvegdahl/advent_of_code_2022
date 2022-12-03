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

end
