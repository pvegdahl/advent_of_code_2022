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
end
