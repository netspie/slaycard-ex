defmodule PlayerId, do: defstruct [:value]

defmodule Player do
  defstruct id: nil

  def new() do
    %Player {
      id: 7
    }
  end
end
