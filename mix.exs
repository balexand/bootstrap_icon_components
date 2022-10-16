defmodule BootstrapIconComponents.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :bootstrap_icon_components,
      description: "Macro for generating Phoenix components for Bootstrap icons.",
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: [
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/balexand/bootstrap_icon_components"}
      ],
      docs: [
        extras: ["README.md"],
        source_ref: "v#{@version}",
        source_url: "https://github.com/balexand/bootstrap_icon_components"
      ]
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
      {:jason, "~> 1.4"},
      {:phoenix_live_view, "~> 0.18"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
