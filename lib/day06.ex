defmodule Day06 do
  def parse_line(line) do
    []
  end

  def packet_begin_position(packet) do
    packet_begin_position(String.to_charlist(packet), 4)
  end

  defp packet_begin_position([_head | tail] = packet, position) do
    distinct_chars = Enum.take(packet, 4)
    |> Enum.uniq()
    |> Enum.count()
    |> check_packet_begin(tail, position)
  end

  defp check_packet_begin(4, _packet_tail, position), do: position

  defp check_packet_begin(_distinct_chars, packet_tail, position) do
    packet_begin_position(packet_tail, position+1)
  end

  def part_a() do
    File.stream!("puzzle_input/day06.txt", [:utf8])
    |> Enum.map(&String.trim/1)
    |> List.first()
    |> packet_begin_position()
  end

  def part_b() do
    # File.stream!("puzzle_input/day06.txt", [:utf8])
    # |> Stream.map(&String.trim/1)
  end
end

IO.puts("Part A: #{Day06.part_a()}")
IO.puts("Part B: #{Day06.part_b()}")
