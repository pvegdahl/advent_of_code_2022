defmodule Day02 do
  def parse_input(path) do
    File.stream!(path, [:utf8])
    |> Stream.map(&String.trim/1)
  end

  def letter_to_rpc("A"), do: :rock
  def letter_to_rpc("B"), do: :paper
  def letter_to_rpc("C"), do: :scissors
  def letter_to_rpc("X"), do: :rock
  def letter_to_rpc("Y"), do: :paper
  def letter_to_rpc("Z"), do: :scissors

  def part_a() do
    parse_input("puzzle_input/day02.txt")
  end

  def part_b() do
    parse_input("puzzle_input/day02.txt")
  end
end
