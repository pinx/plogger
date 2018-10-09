defmodule Plogger do
  @moduledoc """
  Piping logger is a set of wrapper functions for the 
  Elixir Logger library.
  It is inspired by the logging functions in Elm:
  what you pass in, comes out. This makes it easy
  to log intermediate results in a sequence of function
  calls.

  ## Examples
    iex()> require Plogger
    iex()> params
    ...>   |> Plogger.debug("Start")
    ...>   |> some_function()
    ...>   |> Plogger.debug("Step 1")
    ...>   |> other_function()
    ...>   |> Plogger.debug("Step 2")

  The Plogger lines can be added and removed without
  any further changes.
  """

  for level <- [:info, :debug, :warn, :error] do
    defmacro unquote(level)(payload, desc, meta \\ []) do
      level = unquote(level)
      %{module: module, function: fun, file: file, line: line} = __CALLER__
      meta = Keyword.merge([module: module, function: fun, file: file, line: line], meta)
      quote bind_quoted: [level: level, payload: payload, desc: desc, meta: meta] do
        Logger.bare_log(level, desc <> ": " <> inspect(payload), meta)
        payload
      end
    end
  end
end
