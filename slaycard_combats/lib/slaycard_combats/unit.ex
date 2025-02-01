defmodule UnitId do
  defstruct [:value]
end

defmodule Unit do
  defstruct [
    :id,
    :stat_group,
    :artifacts
  ]

  def new() do
    %Unit{
      stat_group: UnitStatGroup.new([
        hp: 10, energy: Stat.new(10), attack: 10, defence: 10, accuracy: 10, dodge: 10, critics: 10, speed: 10])
    }
  end
end
