defmodule CombatTest do
  use ExUnit.Case
  doctest Combat

  test "combat has created event" do
    Combat.new()
    |> (& assert(
      length(&1.events) == 1 &&
      hd(&1.events).content.__struct__ == CombatCreatedEventContent)).()
  end
end
