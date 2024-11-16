defmodule Stat do
  defstruct original_value: 0, modifiers: []

  @type t() :: %Stat{
    original_value: integer(),
    modifiers: []
  }

  def new(value) when is_number(value), do: %Stat{ original_value: value }

  def add_modifier(%Stat{} = stat, modifierValue) when is_number(modifierValue) do
    stat
    |> add_modifier(StatModifier.new(modifierValue, :add))
  end

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
