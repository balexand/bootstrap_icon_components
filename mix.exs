defmodule BootstrapIconComponents.MixProject do
  use Mix.Project

  @version "1.10.3"

  def project do
    [
      app: :bootstrap_icon_components,
      description:
        "Macro for generating Phoenix components for Bootstrap icons. Only include the icons you need to avoid slow compilation and bloated modules.",
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
        main: "BootstrapIconComponents",
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
      {:nimble_options, "~> 0.4"},
      {:phoenix_live_view, "~> 0.18"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
