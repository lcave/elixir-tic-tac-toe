defmodule GameState do
  def game_over?(board) do
    {first_row, second_row, third_row} = board
    {first_column, second_column, third_column} = transpose_cols(board)
    {first_diagonal, second_diagonal} = transpose_diagonals(board)

    cond do
      x_wins?(first_row) or
        x_wins?(second_row) or
        x_wins?(third_row) or
        x_wins?(first_column) or
        x_wins?(second_column) or
        x_wins?(third_column) or
        x_wins?(first_diagonal) or
          x_wins?(second_diagonal) ->
        {true, "X"}

      o_wins?(first_row) or
        o_wins?(second_row) or
        o_wins?(third_row) or
        o_wins?(first_column) or
        o_wins?(second_column) or
        o_wins?(third_column) or
        o_wins?(first_diagonal) or
          o_wins?(second_diagonal) ->
        {true, "O"}

      no_moves_left?(board) ->
        {true, "no-one"}

      true ->
        {false, "no-one"}
    end
  end

  defp x_wins?({"X", "X", "X"}) do
    true
  end

  defp x_wins?(_) do
    false
  end

  defp o_wins?({"O", "O", "O"}) do
    true
  end

  defp o_wins?(_) do
    false
  end

  defp no_moves_left?(board) do
    !Enum.any?(Tuple.to_list(board), fn row ->
      Enum.any?(Tuple.to_list(row), fn cell ->
        cell == " "
      end)
    end)
  end

  defp transpose_cols(board) do
    {first_row, second_row, third_row} = board
    first_column = {elem(first_row, 0), elem(second_row, 0), elem(third_row, 0)}
    second_column = {elem(first_row, 1), elem(second_row, 1), elem(third_row, 1)}
    third_column = {elem(first_row, 2), elem(second_row, 2), elem(third_row, 2)}
    {first_column, second_column, third_column}
  end

  defp transpose_diagonals(board) do
    {first_row, second_row, third_row} = board
    first_diagonal = {elem(first_row, 0), elem(second_row, 1), elem(third_row, 2)}
    second_diagonal = {elem(first_row, 2), elem(second_row, 1), elem(third_row, 0)}
    {first_diagonal, second_diagonal}
  end
end
