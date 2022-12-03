defmodule Day02 do
  def parse_input(path) do
    File.stream!(path, [:utf8])
    |> Stream.map(&parse_line/1)
  end

  def parse_line(line) do
    String.split(line)
    |> Enum.map(&letter_to_rpc/1)
    |> List.to_tuple()
  end

  def letter_to_rpc("A"), do: :rock
  def letter_to_rpc("B"), do: :paper
  def letter_to_rpc("C"), do: :scissors
  def letter_to_rpc("X"), do: :rock
  def letter_to_rpc("Y"), do: :paper
  def letter_to_rpc("Z"), do: :scissors

  def rps_result({same, same}), do: :tie
  def rps_result({:rock, :scissors}), do: :loss
  def rps_result({:scissors, :paper}), do: :loss
  def rps_result({:paper, :rock}), do: :loss
  def rps_result(_), do: :win

  def rps_result_to_points(:win), do: 6
  def rps_result_to_points(:tie), do: 3
  def rps_result_to_points(:loss), do: 0

  def part_a() do
    parse_input("puzzle_input/day02.txt")
  end

  def part_b() do
    parse_input("puzzle_input/day02.txt")
  end
end
