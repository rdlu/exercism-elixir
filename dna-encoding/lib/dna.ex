defmodule DNA do
  @type nucleotide_char :: ?\s | ?A | ?C | ?G | ?T
  @type nucleotide_bitstring :: 0 | 1 | 2 | 4 | 8
  @type dna_charlist :: [nucleotide_char()]
  @type dna_bitstring :: <<_::_*4>>

  @spec encode_nucleotide(nucleotide_char()) :: nucleotide_bitstring()
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0b0000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
    end
  end

  @spec decode_nucleotide(nucleotide_bitstring()) :: nucleotide_char()
  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
  end

  @spec encode(dna_charlist()) :: dna_bitstring()
  def encode([]), do: <<>>
  def encode([head | tail]), do: <<encode_nucleotide(head)::4, encode(tail)::bitstring>>

  @spec decode(bitstring) :: dna_charlist()
  def decode(<<>>), do: []
  def decode(<<head::4, rest::bitstring>>), do: [decode_nucleotide(head) | decode(rest)]
end
