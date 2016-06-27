defmodule Plogger.Mixfile do
  use Mix.Project

  def project do
    [app: :plogger,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     package: package,
     deps: deps()]
  end

  def application do
    [applications: [:logger]]
  end

  defp description do
    """
    Set of wrapper functions for the built-in Logger functions
    `info`, `debug`, `warn`, `error`.
    Because the output of the functions is the same as the input,
    they can be inserted in a sequence of functions, that are linked
    with the pipe ( |> ) operator.
    It works the same as Elm's Debug.log.
    """
  end

  defp package do
    [# These are the default files included in the package
     files: ["lib", "priv", "mix.exs", "README*", "readme*", "LICENSE*", "license*"],
     maintainers: ["Marcel van Pinxteren"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/pinx/plogger"}]
  end

  defp deps do
    []
  end
end
