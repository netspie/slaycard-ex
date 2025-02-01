
defmodule CombatCreatedEventContent do
  defstruct [
    :combat_id,
    :players
  ]
end

defmodule DomainEvent do
  defstruct [
    :id,
    :created_timestamp,
    :content
  ]

  def new(content) do
    %DomainEvent{
      id: 2,
      created_timestamp: DateTime.utc_now() |> DateTime.to_unix(),
      content: content
    }
  end

  def newArr(content), do: [new(content)]
end

defmodule CombatId, do: defstruct [:value]
defmodule Combat do
  @type t :: %Combat{
    id: %CombatId{},
    players: [%Player{}]
  }

  @spec new() :: %{ combat: %Combat{}, events: [%DomainEvent{}]}

  defstruct [
    :id,
    :players
  ]

  def new() do
    %{
      combat: %Combat{},
      events: DomainEvent.newArr(
          %CombatCreatedEventContent{
            combat_id: "",
            players: []
          })
    }
  end

end
