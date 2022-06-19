defmodule Username do
  defguard lower?(char) when char in ?a..?z
  def sanitize(username) do
    Enum.reduce(username, '', &rebuild_chars/2)
  end

  defp rebuild_chars(cur_char, new_chars) do
    new_chars ++ replace_chars(cur_char)
  end

  defp replace_chars(char) do
    case char do
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ß -> 'ss'
      ?ü -> 'ue'
      ?_ -> '_'
      char when lower?(char) -> [char]
      _ -> ''
    end
  end
end
