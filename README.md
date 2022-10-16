# BootstrapIconComponents

[![Package](https://img.shields.io/hexpm/v/bootstrap_icon_components.svg)](https://hex.pm/packages/bootstrap_icon_components) [![Documentation](http://img.shields.io/badge/hex.pm-docs-green.svg?style=flat)](https://hexdocs.pm/bootstrap_icon_components) ![CI](https://github.com/balexand/bootstrap_icon_components/actions/workflows/elixir.yml/badge.svg)

Macro for generating Phoenix components for Bootstrap icons. Only include the icons you need to avoid slow compilation and bloated modules.

Icons are from the [Bootstrap Icons](https://github.com/twbs/icons) project. Version numbers in this project track those from Bootstrap Icons.

## Installation

The package can be installed by adding `bootstrap_icon_components` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:bootstrap_icon_components, "~> 1.9.1"}
  ]
end
```

## Usage

```elixir
defmodule MyApp.Icons do
  use Phoenix.Component
  use BootstrapIconComponents, include: ["1_circle", "cpu"]
end
```

Then call the components in your HEEX templates:

```html
<.MyApp.Icons.bs_1_circle class="w-4" />
```

See [the docs](https://hexdocs.pm/bootstrap_icon_components) for details.
