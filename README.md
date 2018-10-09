# Plogger

Piping logger: logger functions that can inserted in a
piping sequence.

It is inspired by the logging functions in Elm:
what you pass in, comes out. This makes it easy
to log intermediate results in a sequence of function
calls.

```elixir
require Plogger

params
|> Plogger.debug("Start")
|> some_function()
|> Plogger.debug("Step 1")
|> other_function()
|> Plogger.debug("Step 2")
```

The Plogger lines can be added and removed without
any further changes.


## Installation

Add `plogger` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:plogger, "~> 0.1.0"}]
end
```

