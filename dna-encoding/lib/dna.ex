defmodule DNA do
  @type nucleotide_char :: ?\s | ?A | ?C | ?G | ?T
  @type nucleotide_bitstring :: 0 | 1 | 2 | 4 | 8
  @type dna_charlist :: [nucleotide_char()]
  @type dna_bitstring :: <<_::_*4>>

  @encode_map %{
    ?\s => 0b0000,
    ?A => 0b0001,
    ?C => 0b0010,
    ?G => 0b0100,
    ?T => 0b1000
  }

  @decode_map Enum.into(@encode_map, %{}, fn {k, v} -> {v, k} end)

  @spec encode_nucleotide(nucleotide_char()) :: nucleotide_bitstring()
  def encode_nucleotide(nuc), do: Map.fetch!(@encode_map, nuc)

  @spec decode_nucleotide(nucleotide_bitstring()) :: nucleotide_char()
  def decode_nucleotide(nuc), do: Map.fetch!(@decode_map, nuc)

  @spec encode(dna_charlist()) :: dna_bitstring()
  def encode([]), do: <<>>
  def encode([head | tail]), do: <<encode_nucleotide(head)::4, encode(tail)::bitstring>>

  @spec decode(bitstring) :: dna_charlist()
  def decode(<<>>), do: []
  def decode(<<head::4, rest::bitstring>>), do: [decode_nucleotide(head) | decode(rest)]
end
