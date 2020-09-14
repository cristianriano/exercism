defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  require Logger

  @conversions [
    {"M",  1000},
    {"CM", 900},
    {"D",  500},
    {"CD", 400},
    {"C",  100},
    {"XC", 90},
    {"L",  50},
    {"XL", 40},
    {"X",  10},
    {"IX", 9},
    {"V",  5},
    {"IV", 4},
    {"I",  1}
  ]

  @spec numeral(non_neg_integer()) :: String.t()
  def numeral(0), do: ""

  def numeral(number) do
    {roman, arabic} = Enum.find(@conversions, fn {_r, a} ->
      number >= a
    end)

    roman <> numeral(number - arabic)
  end
end
