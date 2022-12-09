defmodule Day09 do
  def parse_line(line) do
    parts = String.split(line, " ")
    number = parts |> Enum.at(1) |> String.to_integer()
    direction = parts |> Enum.at(0) |> direction_string_to_vector()

    {direction, number}
  end

  defp direction_string_to_vector("R"), do: {1, 0}
  defp direction_string_to_vector("L"), do: {-1, 0}
  defp direction_string_to_vector("U"), do: {0, 1}
  defp direction_string_to_vector("D"), do: {0, -1}

  def update_pos_with_vector({x, y}, {dx, dy}), do: {x + dx, y + dy}

  def update_rope_tail_from_rope_head({tail_x, tail_y}, {head_x, head_y}) do
    {dx, dy} = {head_x - tail_x, head_y - tail_y}

    case {dx, dy} do
      {2, _dy} -> {tail_x + 1, head_y}
      {-2, _dy} -> {tail_x - 1, head_y}
      {_dx, 2} -> {head_x, tail_y + 1}
      {_dx, -2} -> {head_x, tail_y - 1}
      _ -> {tail_x, tail_y}
    end
  end

  def move_multiple_knots([head_knot | tail_knots], vector) do
    new_head = update_pos_with_vector(head_knot, vector)
    [new_head | update_multiple_tail_knots(new_head, tail_knots)]
  end

  defp update_multiple_tail_knots(_previous_knot, []), do: []

  defp update_multiple_tail_knots(previous_knot, [first_tail | other_tails]) do
    new_first_tail = update_rope_tail_from_rope_head(first_tail, previous_knot)
    [new_first_tail | update_multiple_tail_knots(new_first_tail, other_tails)]
  end

  def repeated_move_all(positions, move) do
    repeated_move_all(positions, move, [])
  end

  defp repeated_move_all(positions, {_vector, 0}, tail_history), do: {positions, tail_history}

  defp repeated_move_all(positions, {vector, count}, tail_history) do
    new_positions = move_multiple_knots(positions, vector)

    repeated_move_all(new_positions, {vector, count - 1}, [
      List.last(new_positions) | tail_history
    ])
  end

  def list_of_moves(moves, knot_count \\ 2) do
    Enum.reduce(moves, {List.duplicate({0, 0}, knot_count), []}, &my_reducer_func/2)
  end

  defp my_reducer_func(move, {positions, tail_history}) do
    {new_positions, added_tail_history} = repeated_move_all(positions, move)
    {new_positions, added_tail_history ++ tail_history}
  end

  def unique_tail_positions_from_moves(moves, knot_count \\ 2) do
    moves
    |> list_of_moves(knot_count)
    |> elem(1)
    |> Enum.uniq()
    |> Enum.count()
  end

  def implementation(lines, knot_count \\ 2) do
    lines
    |> Enum.map(&parse_line/1)
    |> unique_tail_positions_from_moves(knot_count)
  end

  def part_a() do
    File.stream!("puzzle_input/day09.txt", [:utf8])
    |> Stream.map(&String.trim/1)
    |> implementation()
  end

  def part_b() do
    # File.stream!("puzzle_input/day09.txt", [:utf8])
    # |> Stream.map(&String.trim/1)
  end
end

IO.puts("Part A: #{Day09.part_a()}")
IO.puts("Part B: #{Day09.part_b()}")
