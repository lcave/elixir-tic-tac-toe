defmodule BoardRenderer do
  def render_board(board) do
    {first_row, second_row, third_row} = board

    [
      render_row(first_row),
      "\n-----------\n",
      render_row(second_row),
      "\n-----------\n",
      render_row(third_row)
    ]
    |> Enum.join("")
  end

  defp render_row(row) do
    {first, second, third} = row
    " #{first} | #{second} | #{third} "
  end
end
