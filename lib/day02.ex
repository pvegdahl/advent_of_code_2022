defmodule Day02 do
  def parse_line(line) do
    String.split(line)
    |> Enum.map(&letter_to_rps/1)
    |> List.to_tuple()
  end

  def letter_to_rps("A"), do: :rock
  def letter_to_rps("B"), do: :paper
  def letter_to_rps("C"), do: :scissors
  def letter_to_rps("X"), do: :rock
  def letter_to_rps("Y"), do: :paper
  def letter_to_rps("Z"), do: :scissors

  def rps_result({same, same}), do: :tie
  def rps_result({:rock, :scissors}), do: :loss
  def rps_result({:scissors, :paper}), do: :loss
  def rps_result({:paper, :rock}), do: :loss
  def rps_result(_), do: :win

  def rps_result_to_points(:win), do: 6
  def rps_result_to_points(:tie), do: 3
  def rps_result_to_points(:loss), do: 0

  def rps_throw_to_points(:rock), do: 1
  def rps_throw_to_points(:paper), do: 2
  def rps_throw_to_points(:scissors), do: 3

  def game_points({them, us}) do
    rps_throw_to_points(us) + (rps_result({them, us}) |> rps_result_to_points)
  end

  def score_list_of_games(list_of_games) do
    list_of_games
    |> Enum.map(&parse_line/1)
    |> Enum.map(&game_points/1)
    |> Enum.sum()
  end

  def part_a() do
    File.stream!("puzzle_input/day02.txt", [:utf8])
    |> score_list_of_games()
  end

  def get_throw_for_desired_result(them, :tie), do: them
  def get_throw_for_desired_result(them, :win), do: win(them)
  def get_throw_for_desired_result(them, :loss), do: loss(them)

  def win(:rock), do: :paper
  def win(:paper), do: :scissors
  def win(:scissors), do: :rock

  def loss(:rock), do: :scissors
  def loss(:paper), do: :rock
  def loss(:scissors), do: :paper

  def letter_to_atom("A"), do: :rock
  def letter_to_atom("B"), do: :paper
  def letter_to_atom("C"), do: :scissors
  def letter_to_atom("X"), do: :loss
  def letter_to_atom("Y"), do: :tie
  def letter_to_atom("Z"), do: :win

  def part_b() do
    nil
  end
end

IO.puts("Part A: #{Day02.part_a()}")
