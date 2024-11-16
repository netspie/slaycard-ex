defmodule StatModifier do
  @type t :: %StatModifier {
    id: String.t(),
    value: float(),
    type: :add | :mul
  }

  defstruct id: "", value: 0.0, type: nil

  def new(value, type), do: %StatModifier{ value: value, type: type }

end
