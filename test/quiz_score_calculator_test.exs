defmodule QuizScoreCalculatorTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  @doc """
  {
    "enjoys_job": "yes",
    "good_for_carers": "yes",
    "contracted_hours": 20,
    "hours_actually_worked": 34,
    "unpaid_extra_work": "unsure",
    "age": 26,
    "hourly_rate": "£8.22",
    "submitted_date": 1608211454000
  }
  """
  test "missing values in file are not assigned points" do
    assert capture_io(fn ->
             QuizScoreCalculator.score("./test/quiz_responses/response_missing.json")
           end) =~ "Score is 2/5 (40%)"
  end

  @doc"""
  {
    "enjoys_job": "yes",
    "repected_by_managers": "yes",
    "good_for_carers": "yes",
    "contracted_hours": 20,
    "hours_actually_worked": 27,
    "unpaid_extra_work": "no",
    "age": 26,
    "hourly_rate": "£8.91",
    "submitted_date": 1608211454000
  }
  """
  test "all values are assigned points correctly" do
    assert capture_io(fn ->
             QuizScoreCalculator.score("./test/quiz_responses/response_100.json")
           end) =~ "Score is 5/5 (100%)"
  end
end
