defmodule HighScore do
  @initial_score 0
  defdelegate new, to: Map

  def add_player(scores, name, score \\ @initial_score) do
    Map.put(scores, name, score)
  end

  defdelegate remove_player(scores, name), to: Map, as: :delete

  def reset_score(scores, name), do: add_player(scores, name)

  def update_score(scores, name, score) do
    Map.update(scores, name, score, & &1 + score)
  end

  def get_players(scores), do: Map.keys(scores)
end
