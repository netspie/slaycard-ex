defmodule Stat do
  defstruct original_value: 0, modifiers: []

  def add_modifier(%Stat{} = stat, %StatModifier{} = modifier) do
    %Stat{
      stat |
      modifiers: stat.modifiers ++ [modifier]
    }
  end

  def calculate_value(%Stat{} = stat) do
    Enum.reduce(
      stat.modifiers,
      stat.original_value,
      fn modifier, acc ->
        case modifier.type do
          :add -> acc + modifier.value
          :mul -> acc * modifier.value
          _ -> acc
        end
      end)
  end
end
