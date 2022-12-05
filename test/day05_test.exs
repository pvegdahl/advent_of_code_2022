defmodule Day05Test do
  use ExUnit.Case

  test "Parse a simple line of boxes" do
    assert Day05.parse_box_line("[A] [B] [C]") == ~w(A B C)
  end
end
