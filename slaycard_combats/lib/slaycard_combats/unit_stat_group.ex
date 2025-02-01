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

  def new(stats) when is_list(stats) do
    %UnitStatGroup{
      hp: getStat(stats, :hp),
      energy: getStat(stats, :energy),
      attack: getStat(stats, :attack),
      defence: getStat(stats, :defence),
      accuracy: getStat(stats, :accuracy),
      dodge: getStat(stats, :critics),
      critics: getStat(stats, :critics),
      speed: getStat(stats, :speed)
    }
  end

  defp getStat(stats, stat_atom)
    when is_list(stats)
    when is_atom(stat_atom) do
    stats |> Keyword.get(stat_atom, 0) |> getStat
  end

  defp getStat(stat) do
    cond do
      is_struct(stat, Stat) -> stat
      is_number(stat) -> Stat.new(stat)
      true -> "Not a valid stat"
    end
  end
end
