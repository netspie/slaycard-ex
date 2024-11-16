defmodule UnitStatGroup do
  defstruct [
    :hp,
    :energy,
    :attack,
    :defence,
    :accuracy,
    :dodge,
    :critics,
    :speed
  ]

  @type t() :: %UnitStatGroup{
    hp: Stat.t(),
    energy: Stat.t(),
    attack: Stat.t(),
    defence: Stat.t(),
    accuracy: Stat.t(),
    dodge: Stat.t(),
    critics: Stat.t(),
    speed: Stat.t()
  }

  @type x :: Stat.t() | number()
  @spec new(%Stat{} | number(), %Stat{} | number(), %Stat{} | number(), %Stat{} | number(), %Stat{} | number(), %Stat{} | number(), %Stat{} | number(), %Stat{} | number())
  :: UnitStatGroup.t()
  def new(hp, energy, attack, defence, accuracy, dodge, critics, speed) when is_number(hp) do
    %UnitStatGroup{
      hp: Stat.new(hp),
      energy: Stat.new(energy),
      attack: Stat.new(attack),
      defence: Stat.new(defence),
      accuracy: Stat.new(accuracy),
      dodge: Stat.new(dodge),
      critics: Stat.new(critics),
      speed: Stat.new(speed)
    }
  end

  def new(hp, energy, attack, defence, accuracy, dodge, critics, speed) do
    %UnitStatGroup{
      hp: hp,
      energy: energy,
      attack: attack,
      defence: defence,
      accuracy: accuracy,
      dodge: dodge,
      critics: critics,
      speed: speed
    }
  end
end
