defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna |>
      Enum.map(&char_to_rna(&1))
  end

  def char_to_rna(?A) do ?U end
  def char_to_rna(?C) do ?G end
  def char_to_rna(?G) do ?C end
  def char_to_rna(?T) do ?A end
end
