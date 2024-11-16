defmodule UnitId do
  defstruct [:value]
end

defmodule Unit do
  defstruct [
    :id,
    :stats,
    :artifacts
  ]

  def new() do
    stats = UnitStatGroup.new(10, 10, 10, 10, 10, 10, 10, 10)
    IO.puts stats.hp
  end

end
