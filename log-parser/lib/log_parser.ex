defmodule LogParser do
  def valid_line?(line) do
    String.match?(line, ~r/^\[(DEBUG|INFO|ERROR|WARNING)/)
  end

  def split_line(line) do
    String.split(line, ~r/<[~*=-]*>/)
  end

  def remove_artifacts(line) do
    Regex.replace(~r/end-of-line\d+/i, line, "")
  end

  def tag_with_user_name(line) do
    captures = Regex.run(~r/User\s+(\S+)/, line)

    case captures do
      [_, name] -> "[USER] #{name} #{line}"
      nil -> line
    end
  end
end
