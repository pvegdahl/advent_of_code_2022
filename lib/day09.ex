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

  def repeated_move_both(positions, {vector, count}) do
    repeated_move_both(positions, {vector, count}, [])
  end

  defp repeated_move_both(positions, {vector, 0}, tail_history), do: {positions, tail_history}

  defp repeated_move_both(positions, {vector, count}, tail_history) do
    %{tail: tail_pos} = new_positions = move_both(positions, vector)
    repeated_move_both(new_positions, {vector, count - 1}, [tail_pos | tail_history])
  end

  def part_a() do
    # File.stream!("puzzle_input/day09.txt", [:utf8])
    # |> Stream.map(&String.trim/1)
  end

  def part_b() do
    # File.stream!("puzzle_input/day09.txt", [:utf8])
    # |> Stream.map(&String.trim/1)
  end
end

IO.puts("Part A: #{Day09.part_a()}")
IO.puts("Part B: #{Day09.part_b()}")
