defmodule SlaycardCombatsTest do
  use ExUnit.Case
  doctest SlaycardCombats

  test "calculate stat value" do
    %Stat { original_value: 10 }
    |> Stat.calculate_value
    |> (& assert &1 == 10).()
  end

  test "calculate stat value with mod of add = 1" do
    %Stat { original_value: 10, modifiers: [StatModifier.new(1, :add)] }
    |> Stat.calculate_value
    |> (& assert &1 == 11).()
  end

  test "calculate stat value with mod of mul = 2" do
    %Stat { original_value: 10, modifiers: [StatModifier.new(2, :mul)] }
    |> Stat.calculate_value
    |> (& assert &1 == 20).()
  end

end
