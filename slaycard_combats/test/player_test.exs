defmodule PlayerTest do
  use ExUnit.Case
  doctest Player

  test "player" do
    Player.new()
    |> (& assert &1.id == 7).()
  end
end
