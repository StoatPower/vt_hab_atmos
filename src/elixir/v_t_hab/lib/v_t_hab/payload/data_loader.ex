defmodule VTHab.Payload.DataLoader do
  alias NimbleCSV.RFC4180, as: CSV
  alias VTHab.Payload.Sample

  @csv_path "../../../launch_data/launchData11-7-2025-started-6-46.csv"

  def stream_launch_csv() do
    default_csv_path()
    |> File.stream!(read_ahead: 100_000)
    |> CSV.parse_stream()
    |> Stream.map(&to_sample/1)
  end

  def to_sample([c1, c2, c3, c4, c5, c6, c7, c8]) do
    [
      pressure_alt_m: c1,
      pressure_hpa: c2,
      temp_bme_c: c3,
      rh_percent: c4,
      gas_kohm: c5,
      temp_tmp_c: c6,
      battery_v: c7,
      elapsed_time_ms: c8
    ]
    |> Keyword.new()
    |> Sample.new()
  end

  def default_csv_path do
    Path.join([File.cwd!(), @csv_path])
    |> Path.expand()
  end

end
