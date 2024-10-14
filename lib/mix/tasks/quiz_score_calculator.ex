defmodule Mix.Tasks.QuizScoreCalculator do
    @moduledoc "Calculate a response quiz's score"
    import MinimumWages

    @total 5

    use Mix.Task

    def run([filename]) do
      responses = get_responses(filename)
      score = calculate_score(responses)

      IO.puts("Score is #{score}/#{@total} (#{div(score * 100, @total)}%)")
    end

    def calculate_score(responses) do
      Enum.reduce(responses, 0, fn response, points -> points + points_for(response, responses) end)
    end

    defp get_responses(filename) do
      {:ok, contents} = File.read(filename)
      Jason.decode!(contents)
    end

    defp points_for({"enjoys_job", "yes"}, _), do: 1
    defp points_for({"respected_by_managers", "yes"}, _), do: 1
    defp points_for({"good_for_carers", "yes"}, _), do: 1
    defp points_for({"unpaid_extra_work", "no"}, _), do: 1

    defp points_for({"hourly_rate", rate}, %{"submitted_date" => date, "submitted_age" => age}) do
      if rate >= minimum_wage(date, age), do: 1, else: 0
    end

    defp points_for({"hours_actually_worked", worked_hours}, %{"contracted_hours" => contracted_hours}) do
      if worked_hours < (contracted_hours + 8), do: 1, else: 0
    end

    defp points_for({_response, _value}, _responses), do: 0
end
