defmodule QuizScoreCalculator do
  def score(filename) do
    responses = get_responses(filename)
  end

  defp get_responses(filename) do
    {:ok, contents} = File.read(filename)
    Jason.decode!(contents)
  end
end
