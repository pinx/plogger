defmodule Plogger.MetaTest do
  use ExUnit.Case
  require Plogger

  defmodule Backend do
    @behaviour :gen_event

    def register(test) do
      :gen_event.call(Logger, __MODULE__, {:register, test}, :infinity)
    end

    def init(__MODULE__) do
      {:ok, nil}
    end

    def handle_call({:configure, opts}, state) do
      IO.inspect(opts, label: "opts")
      {:ok, state}
    end

    def handle_call({:register, pid}, _), do: {:ok, :ok, pid}

    def handle_event(:flush, _state), do: {:ok, nil}

    def handle_event(_, nil), do: {:ok, nil}

    def handle_event({level, _gl, {Logger, iodata, _, meta}}, pid) do
      send pid, {level, iodata, meta}
      {:ok, pid }
    end
  end

  test "keeps metadata" do
    {:ok, _pid} = Logger.add_backend(Backend)
    Backend.register(self())
    Plogger.debug("hey!", "description", [test: :should_exist])
    assert_receive {:debug, "description: \"hey!\"", meta}
    assert meta[:pid] == self()
    assert meta[:module] == __MODULE__
    assert meta[:file]
    assert meta[:function]
    assert meta[:line]
  end

end