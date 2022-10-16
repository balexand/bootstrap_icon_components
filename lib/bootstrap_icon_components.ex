defmodule BootstrapIconComponents do
  @svg_regex ~R{\A(<svg.+)class="[^"]+"([^>]+)>(.+)\z}ms

  defmacro __using__(opts) do
    opts = Keyword.validate!(opts, [:include])

    Keyword.fetch!(opts, :include)
    |> Enum.map(fn name when is_binary(name) ->
      svg =
        case File.read("./priv/icons/#{String.replace(name, "_", "-")}.svg") do
          {:ok, svg} -> svg
          {:error, :enoent} -> raise "no icon named #{inspect(name)} available"
        end

      [_, svg_start, svg_end, rest] = Regex.run(@svg_regex, svg)

      quote do
        def unquote(String.to_atom("icon_" <> name))(var!(assigns)) do
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
