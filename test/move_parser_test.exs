defmodule MoveParserTest do
  use ExUnit.Case

  setup do
    %{
      board: {
        {" ", " ", " "},
        {" ", "X", " "},
        {" ", " ", " "}
      }
    }
  end

  test "returns invalid move when the input is not a pair of space separated integers", %{
    board: board
  } do
    assert MoveParser.parse_move(board, "a b") == {:invalid_move, nil}
  end

  test "returns invalid move when the input is not space separated", %{board: board} do
    assert MoveParser.parse_move(board, "1,2") == {:invalid_move, nil}
  end

  test "returns invalid move when the row is greater than 3", %{board: board} do
    assert MoveParser.parse_move(board, "4 2") == {:invalid_move, nil}
  end

  test "returns invalid move when the column is greater than 3", %{board: board} do
    assert MoveParser.parse_move(board, "2 4") == {:invalid_move, nil}
  end

  test "returns invalid move when the row is less than 1", %{board: board} do
    assert MoveParser.parse_move(board, "0 2") == {:invalid_move, nil}
  end

  test "returns invalid move when the column is less than 1", %{board: board} do
    assert MoveParser.parse_move(board, "2 0") == {:invalid_move, nil}
  end

  test "returns invalid move when the move is not possible given the board state", %{board: board} do
    assert MoveParser.parse_move(board, "2 2") == {:invalid_move, nil}
  end

  test "returns the row and column of the move", %{board: board} do
    assert MoveParser.parse_move(board, "1 1") == {0, 0}
  end
end
