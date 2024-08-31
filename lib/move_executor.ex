defmodule MoveExecutor do
  def execute_move(board, {row, col}, player) do
    row_to_change = elem(board, row)

    put_elem(board, row, put_elem(row_to_change, col, player))
  end
end
