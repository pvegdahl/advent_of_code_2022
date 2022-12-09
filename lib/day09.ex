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

  def update_pos_with_vector({x, y}, {dx, dy}), do: {x+dx, y+dy}

  def update_rope_tail_from_rope_head({tail_x, tail_y}, {head_x, head_y}) do
    {dx, dy} = {head_x - tail_x, head_y - tail_y}
    case {dx, dy} do
      {2, _dy} -> {tail_x+1, head_y}
      {-2, _dy} -> {tail_x-1, head_y}
      {_dx, 2} -> {head_x, tail_y+1}
      {_dx, -2} -> {head_x, tail_y-1}
      _ -> {tail_x, tail_y}
    end
  end

  def move_both(%{head: head_pos, tail: tail_pos}, vector) do
    new_head = update_pos_with_vector(head_pos, vector)
    new_tail = update_rope_tail_from_rope_head(tail_pos, new_head)
    %{head: new_head, tail: new_tail}
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

  def repeated_move_both(positions, {vector, count}) do
    repeated_move_both(positions, {vector, count}, [])
  end


  defp repeated_move_both(%{head: head_pos, tail: tail_pos}, {vector, count}, tail_history) do
    {[new_head, new_tail], new_tail_history} = repeated_move_all([head_pos, tail_pos], {vector, count}, tail_history)
    {%{head: new_head, tail: new_tail}, new_tail_history}
  end

  defp repeated_move_all(positions, {vector, 0}, tail_history), do: {positions, tail_history}
  defp repeated_move_all([head_pos, tail_pos], {vector, count}, tail_history) do
    [new_head_pos, new_tail_pos] = new_positions = move_multiple_knots([head_pos, tail_pos], vector)
    repeated_move_all(new_positions, {vector, count - 1}, [new_tail_pos | tail_history])
  end

  def list_of_moves(moves) do
    Enum.reduce(moves, {%{tail: {0, 0}, head: {0, 0}} , []}, &my_reducer_func/2)
  end

  defp my_reducer_func(move, {positions, tail_history}) do
    {new_positions, added_tail_history} = repeated_move_both(positions, move)
    {new_positions, added_tail_history ++ tail_history}
  end

  def unique_tail_positions_from_moves(moves) do
    moves
    |> list_of_moves()
    |> elem(1)
    |> Enum.uniq()
    |> Enum.count()
  end

  def part_a_impl(lines) do
    lines
    |> Enum.map(&parse_line/1)
    |> unique_tail_positions_from_moves()
  end

  def part_a() do
    File.stream!("puzzle_input/day09.txt", [:utf8])
    |> Stream.map(&String.trim/1)
    |> part_a_impl()
  end

  def part_b() do
    # File.stream!("puzzle_input/day09.txt", [:utf8])
    # |> Stream.map(&String.trim/1)
  end
end

IO.puts("Part A: #{Day09.part_a()}")
IO.puts("Part B: #{Day09.part_b()}")
