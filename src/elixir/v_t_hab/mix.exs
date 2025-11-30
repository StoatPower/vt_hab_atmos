defmodule VTHab.MixProject do
  use Mix.Project

  def project do
    [
      app: :v_t_hab,
      version: "0.1.0",
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:explorer, "~> 0.11.1"},
      {:nimble_csv, "~> 1.3.0"},
      {:nx, "~> 0.10.0"},
      {:exla, "~> 0.10.0"},
      {:vega_lite, "~> 0.1.11"},
      {:vega_lite_convert, "~> 1.0.1"},
      {:kino_vega_lite, "~> 0.1.13"},
      {:kino_explorer, "~> 0.1.25"}
    ]
  end
end
