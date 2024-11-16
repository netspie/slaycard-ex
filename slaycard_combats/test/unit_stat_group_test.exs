defmodule UnitStatGroupTest do
  use ExUnit.Case
  doctest UnitStatGroup

  test "stat group" do
    UnitStatGroup.new(10, 10, 10, 10, 10, 10, 10, 10)
    |> Map.from_struct
    |> Map.values
    |> Enum.all?(& &1.original_value == 10)
    |> (& assert &1 == true).()
  end

end
