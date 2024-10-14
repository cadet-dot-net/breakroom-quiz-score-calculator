defmodule MinimumWages do
  # wages from: https://www.gov.uk/national-minimum-wage-rates
  # format: date_unix_ms => %{min_age => hourly_wage}
  @minimum_wages_by_date %{
    1_522_540_800_000 => %{0 => 4.20, 18 => 5.90, 20 => 7.38, 25 => 7.83},
    1_554_076_800_000 => %{0 => 4.35, 18 => 6.15, 20 => 7.70, 25 => 8.21},
    1_585_699_200_000 => %{0 => 4.55, 18 => 6.45, 20 => 8.20, 25 => 8.72},
    1_617_235_200_000 => %{0 => 4.62, 18 => 6.56, 21 => 8.36, 23 => 8.91},
    1_648_771_200_000 => %{0 => 4.81, 18 => 6.83, 21 => 9.18, 23 => 9.50},
    1_680_307_200_000 => %{0 => 5.28, 18 => 7.49, 21 => 10.18, 23 => 10.42},
    1_711_929_600_000 => %{0 => 6.40, 18 => 8.60, 21 => 11.44}
  }

  def minimum_wage(submitted_date, submitted_age) do
    wages_for_date(submitted_date)
    |> Enum.sort(:desc)
    |> Enum.find_value(fn {age, wage} -> if submitted_age >= age, do: wage end)
  end

  defp wages_for_date(submitted_date) do
    @minimum_wages_by_date
    |> Enum.sort(:desc)
    |> Enum.find_value(%{}, fn {date, wages} -> if submitted_date >= date, do: wages end)
  end
end
