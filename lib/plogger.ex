defmodule Plogger do
  @moduledoc """
  Piping logger is a set of wrapper functions for the 
  Elixir Logger library.
  It is inspired by the logging functions in Elm:
  what you pass in, comes out. This makes it easy
  to log intermediate results in a sequence of function
  calls.

  params
  |> Plogger.debug("Start")
  |> some_function()
  |> Plogger.debug("Step 1")
  |> other_function()
  |> Plogger.debug("Step 2")

  The Plogger lines can be added and removed without
  any further changes.
  """

  require Logger

  def info(payload, desc) do
    Logger.info(desc <> ": " <> (inspect payload))
    payload
  end

  def debug(payload, desc) do
    Logger.debug(desc <> ": " <> (inspect payload))
    payload
  end

  def warn(payload, desc) do
    Logger.warn(desc <> ": " <> (inspect payload))
    payload
  end

  def error(payload, desc) do
    Logger.error(desc <> ": " <> (inspect payload))
    payload
  end
end
