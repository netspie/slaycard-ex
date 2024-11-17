defmodule CombatId, do: defstruct [:value]

defmodule BattleCreatedEventContent do
  defstruct [
    :battle_id,
    :players
  ]
end

defmodule DomainEvent do
  defstruct [
    :id,
    :created_timestamp,
    :content
  ]

  @type t() :: %DomainEvent {
    id: String.t(),
    created_timestamp: integer(),
    content: %{}
  }

  @spec new(struct()) :: %DomainEvent{}
  def new(content) do
    %DomainEvent{
      id: 2,
      created_timestamp: DateTime.utc_now() |> DateTime.to_unix(),
      content: content
    }
  end

  @spec newArr(struct()) :: [%DomainEvent{}]
  def newArr(content), do: [new(content)]
end

defmodule Combat do
  defstruct [
    :id,
    :players
  ]

  @type t() :: %Combat{
    id: %CombatId{},
    players: [%Player{}]
  }

  @spec new() :: %{ combat: %Combat{}, events: [%DomainEvent{}] }
  def new() do
    %{
      combat: %Combat{},
      events: DomainEvent.newArr(
          %BattleCreatedEventContent{
            battle_id: "",
            players: []
          })
    }
  end

end
