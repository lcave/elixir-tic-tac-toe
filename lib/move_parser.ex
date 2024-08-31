defmodule MoveParser do
  def parse_move(board, move) do
    case(String.split(String.trim(move), " ")) do
      [row, column] ->
        parse_row_and_column(board, row, column)

      _ ->
        {:invalid_move, nil}
    end
  end

  defp parse_row_and_column(board, row, column) do
    row_num = parse_integer(row)
    column_num = parse_integer(column)

    if row_num in [1, 2, 3] and column_num in [1, 2, 3] do
      validate_move(board, row_num, column_num)
    else
      {:invalid_move, nil}
    end
  end

  defp parse_integer(value) do
    case Integer.parse(value) do
      :error ->
        nil

      {number, _} ->
        number
    end
  end

  defp validate_move(board, row, column) do
    if elem(elem(board, row - 1), column - 1) == " " do
      {row - 1, column - 1}
    else
      {:invalid_move, nil}
    end
  end
end
