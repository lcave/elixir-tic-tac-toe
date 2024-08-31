defmodule MoveExecutorTest do
  use ExUnit.Case

  setup do
    %{
      board: {
        {" ", " ", " "},
        {" ", " ", " "},
        {" ", " ", " "}
      }
    }
  end

  describe "making valid moves" do
    test "executes a valid move at 0 0", %{board: board} do
      assert MoveExecutor.execute_move(board, {0, 0}, "B") == {
               {"B", " ", " "},
               {" ", " ", " "},
               {" ", " ", " "}
             }
    end

    test "executes a valid move at 0 1", %{board: board} do
      assert MoveExecutor.execute_move(board, {0, 1}, "C") == {
               {" ", "C", " "},
               {" ", " ", " "},
               {" ", " ", " "}
             }
    end

    test "executes a valid move at 0 2", %{board: board} do
      assert MoveExecutor.execute_move(board, {0, 2}, "A") == {
               {" ", " ", "A"},
               {" ", " ", " "},
               {" ", " ", " "}
             }
    end

    test "executes a valid move at 1 0", %{board: board} do
      assert MoveExecutor.execute_move(board, {1, 0}, "E") == {
               {" ", " ", " "},
               {"E", " ", " "},
               {" ", " ", " "}
             }
    end

    test "executes a valid move at 1 1", %{board: board} do
      assert MoveExecutor.execute_move(board, {1, 1}, "D") == {
               {" ", " ", " "},
               {" ", "D", " "},
               {" ", " ", " "}
             }
    end

    test "executes a valid move at 1 2", %{board: board} do
      assert MoveExecutor.execute_move(board, {1, 2}, "H") == {
               {" ", " ", " "},
               {" ", " ", "H"},
               {" ", " ", " "}
             }
    end

    test "executes a valid move at 2 0", %{board: board} do
      assert MoveExecutor.execute_move(board, {2, 0}, "O") == {
               {" ", " ", " "},
               {" ", " ", " "},
               {"O", " ", " "}
             }
    end

    test "executes a valid move at 2 1", %{board: board} do
      assert MoveExecutor.execute_move(board, {2, 1}, "U") == {
               {" ", " ", " "},
               {" ", " ", " "},
               {" ", "U", " "}
             }
    end

    test "executes a valid move at 2 2", %{board: board} do
      assert MoveExecutor.execute_move(board, {2, 2}, "A") == {
               {" ", " ", " "},
               {" ", " ", " "},
               {" ", " ", "A"}
             }
    end
  end

  test "executes an invalid move, not caring if another player's token is already present" do
    board = {
      {"Z", " ", " "},
      {" ", " ", " "},
      {" ", " ", " "}
    }

    assert MoveExecutor.execute_move(board, {0, 0}, "P") == {
             {"P", " ", " "},
             {" ", " ", " "},
             {" ", " ", " "}
           }
  end
end
