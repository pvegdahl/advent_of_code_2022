defmodule Day06 do
  def packet_begin_position(packet, unique_chars \\ 4) do
    packet_begin_position(String.to_charlist(packet), unique_chars, unique_chars)
  end

  defp packet_begin_position([_head | tail] = packet, position, unique_chars) do
    Enum.take(packet, unique_chars)
    |> Enum.uniq()
    |> Enum.count()
    |> check_packet_begin(tail, position, unique_chars)
  end

  defp check_packet_begin(unique_chars, _packet_tail, position, unique_chars), do: position

  defp check_packet_begin(_distinct_chars, packet_tail, position, unique_chars) do
    packet_begin_position(packet_tail, position + 1, unique_chars)
  end

  def part_a() do
    File.stream!("puzzle_input/day06.txt", [:utf8])
    |> Enum.map(&String.trim/1)
    |> List.first()
    |> packet_begin_position(4)
  end

  def part_b() do
    File.stream!("puzzle_input/day06.txt", [:utf8])
    |> Enum.map(&String.trim/1)
    |> List.first()
    |> packet_begin_position(14)
  end
end

IO.puts("Part A: #{Day06.part_a()}")
IO.puts("Part B: #{Day06.part_b()}")
