defmodule Helpers.Datetime do
  @deprecated """
  Only used within the iex repl to generate unix times for
  MinimumWages @minimum_wages_by_date module attribute
  """
  def datetime_to_unix(date) do
    {:ok, dt} = DateTime.new(date, ~T[00:00:00], "Etc/UTC")
    DateTime.to_unix(dt, :millisecond)
  end
end
