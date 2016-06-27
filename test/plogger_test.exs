defmodule PloggerTest do
  use ExUnit.Case

  test "it works" do
    1
    |> Plogger.info("One")
    |> assert_in_delta(1, 0.00001)

    %{a: 1}
    |> Plogger.warn("Map")
    |> Map.fetch!(:a)
    |> assert_in_delta(1, 0.00001)

    [1, 2]
    |> Plogger.debug("List")
    |> List.first()
    |> assert_in_delta(1, 0.00001)

    {1, 2}
    |> Plogger.error("Tuple")
    |> elem(0)
    |> assert_in_delta(1, 0.00001)
  end
end
