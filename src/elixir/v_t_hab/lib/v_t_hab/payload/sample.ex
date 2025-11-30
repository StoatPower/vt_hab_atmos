defmodule VTHab.Payload.Sample do
  @moduledoc """
  Describes a complete sample row of raw data from the launch data CSV.
  """

  @type t :: %__MODULE__{
    battery_v: float() | :corrupt | nil,
    gas_kohm: float() | :corrupt | nil,
    pressure_alt_m: float() | :corrupt | nil,
    pressure_hpa: float() | :corrupt | nil,
    rh_percent: float() | :corrupt | nil,
    temp_bme_c: float() | :corrupt | nil,
    temp_tmp_c: float() | :corrupt | nil,
    elapsed_time_ms: integer() | :corrupt | nil
  }

  defstruct [
    :battery_v,
    :gas_kohm,
    :pressure_alt_m,
    :pressure_hpa,
    :rh_percent,
    :temp_bme_c,
    :temp_tmp_c,
    :elapsed_time_ms
  ]

  def new(props) do
    %__MODULE__{
      battery_v: decode_float_prop(props, :battery_v),
      gas_kohm: decode_float_prop(props, :gas_kohm),
      pressure_alt_m: decode_float_prop(props, :pressure_alt_m),
      pressure_hpa: decode_float_prop(props, :pressure_hpa),
      rh_percent: decode_float_prop(props, :rh_percent),
      temp_bme_c: decode_float_prop(props, :temp_bme_c),
      temp_tmp_c: decode_float_prop(props, :temp_tmp_c),
      elapsed_time_ms: decode_int_prop(props, :elapsed_time_ms)
    }
  end

  def decode_float_prop(props, key) do
    case Keyword.get(props, key) do
      value when is_binary(value) ->
        parse_float(value)

      value when is_float(value) ->
        value

      _ ->
        nil
    end
  end

  def decode_int_prop(props, key) do
    case Keyword.get(props, key) do
      value when is_binary(value) ->
        parse_int(value)

      value when is_integer(value) ->
        value

      _ ->
        nil
    end
  end

  defp parse_float(str) do
    case Float.parse(str) do
      {value, _} -> value
      :error -> :corrupt
    end
  end

  defp parse_int(str) do
    case Integer.parse(str) do
      {value, _} -> value
      :error -> :corrupt
    end
  end
end
