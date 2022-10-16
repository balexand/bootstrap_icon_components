defmodule BootstrapIconComponents do
  @opts_schema [
    include: [
      type: {:list, :string},
      required: true,
      doc: "List of icon names to include."
    ],
    prefix: [
      type: :string,
      default: "bs",
      doc: "Prefix for icon function names."
    ]
  ]

  @moduledoc """
  Creates function components for Bootstrap icons.

  ## Usage

      defmodule MyApp.Icons do
        use Phoenix.Component
        use BootstrapIconComponents, include: ["1_circle", "cpu"]
      end

  Then call the components in your HEEX templates:

      <.MyApp.Icons.bs_1_circle class="w-4" />

  ## Options

  #{NimbleOptions.docs(@opts_schema)}
  """

  @svg_regex ~R{\A(<svg.+)class="[^"]+"([^>]+)>(.+)\z}ms

  defmacro __using__(opts) do
    {opts, _binding} =
      Code.eval_quoted(
        quote do
          unquote(opts)
        end
      )

    opts = NimbleOptions.validate!(opts, @opts_schema)

    Enum.map(opts[:include], fn name when is_binary(name) ->
      svg =
        Path.expand("../../priv/icons/#{String.replace(name, "_", "-")}.svg", __ENV__.file)
        |> File.read()
        |> case do
          {:ok, svg} -> svg
          {:error, :enoent} -> raise "no icon named #{inspect(name)} available"
        end

      [_, svg_start, svg_end, rest] = Regex.run(@svg_regex, svg)

      quote do
        def unquote(String.to_atom(opts[:prefix] <> "_" <> name))(var!(assigns)) do
          var!(assigns) =
            Phoenix.Component.assign(var!(assigns), %{
              attrs: Phoenix.Component.assigns_to_attributes(var!(assigns))
            })

          unquote(
            EEx.compile_string(svg_start <> svg_end <> " {@attrs}>" <> rest,
              engine: Phoenix.LiveView.HTMLEngine
            )
          )
        end
      end
    end)
  end
end
