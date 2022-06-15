# Credits to jaimeiniesta, TIL `in` for maps
defmodule LogLevel do
  @labels %{
    0 => :trace,
    1 => :debug,
    2 => :info,
    3 => :warning,
    4 => :error,
    5 => :fatal
  }

  @all_codes 0..5
  @legacy_codes 1..4

  def to_label(level, legacy?) do
    cond do
      legacy? and level in @legacy_codes -> @labels[level]
      not legacy? and level in @all_codes -> @labels[level]
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)

    cond do
      label in [:error, :fatal] -> :ops
      label == :unknown and legacy? -> :dev1
      label == :unknown and !legacy? -> :dev2
      true -> false
    end
  end
end
