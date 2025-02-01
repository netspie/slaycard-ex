defmodule UnitStatGroupTest do
  use ExUnit.Case
  doctest UnitStatGroup

  test "stat group" do
    UnitStatGroup.new(hp: 10, energy: Stat.new(10), attack: 10, defence: 10, accuracy: 10, dodge: 10, critics: 10, speed: 10)
    |> Map.from_struct
    |> Map.values
    |> Enum.all?(& &1.original_value == 10)
    |> (& assert &1 == true).()
  end

end
