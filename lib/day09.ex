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
      {2, 0} -> {tail_x+1, tail_y}
      _ -> {tail_x, tail_y}
    end
  end
  # def update_rope_tail_from_rope_head(tail_pos, _), do: tail_pos

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
