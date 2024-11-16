defmodule StatTest do
  use ExUnit.Case
  doctest Stat

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

  test "add modifier" do
    %Stat { original_value: 10, modifiers: [StatModifier.new(2, :mul)] }
    |> Stat.add_modifier(5)
    |> (fn stat -> assert length(stat.modifiers) == 2 end).()
  end

end
