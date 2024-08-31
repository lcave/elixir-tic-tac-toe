defmodule GameStateTest do
  use ExUnit.Case

  test "returns false and none when there are still possible moves" do
    board = {
      {"X", "O", "X"},
      {"X", "X", "O"},
      {" ", " ", "O"}
    }

    assert GameState.game_over?(board) == {false, "no-one"}
  end

  describe "X wins" do
    test "returns true and X when X wins using row 1" do
      board = {
        {"X", "X", "X"},
        {"O", "O", "X"},
        {"O", "X", "O"}
      }

      assert GameState.game_over?(board) == {true, "X"}
    end

    test "returns true and X when X wins using row 2" do
      board = {
        {"O", "O", "X"},
        {"X", "X", "X"},
        {"O", "X", "O"}
      }

      assert GameState.game_over?(board) == {true, "X"}
    end

    test "returns true and X when X wins using row 3" do
      board = {
        {"O", "O", "X"},
        {"O", "X", "O"},
        {"X", "X", "X"}
      }

      assert GameState.game_over?(board) == {true, "X"}
    end

    test "returns true and X when X wins using column 1" do
      board = {
        {"X", "O", "X"},
        {"X", "O", "O"},
        {"X", "X", "O"}
      }

      assert GameState.game_over?(board) == {true, "X"}
    end

    test "returns true and X when X wins using column 2" do
      board = {
        {"O", "X", "X"},
        {"O", "X", "O"},
        {"X", "X", "O"}
      }

      assert GameState.game_over?(board) == {true, "X"}
    end

    test "returns true and X when X wins using column 3" do
      board = {
        {"O", "O", "X"},
        {"O", "X", "X"},
        {"X", "O", "X"}
      }

      assert GameState.game_over?(board) == {true, "X"}
    end

    test "returns true and X when X wins using the first diagonal" do
      board = {
        {"X", "O", "X"},
        {"O", "X", "O"},
        {"O", "O", "X"}
      }

      assert GameState.game_over?(board) == {true, "X"}
    end

    test "returns true and X when X wins using the second diagonal" do
      board = {
        {"O", "O", "X"},
        {"O", "X", "O"},
        {"X", "O", "O"}
      }

      assert GameState.game_over?(board) == {true, "X"}
    end
  end

  describe "O wins" do
    test "returns true and O when O wins using row 1" do
      board = {
        {"O", "O", "O"},
        {"X", "X", "O"},
        {"X", "O", "X"}
      }

      assert GameState.game_over?(board) == {true, "O"}
    end

    test "returns true and O when O wins using row 2" do
      board = {
        {"X", "X", "O"},
        {"O", "O", "O"},
        {"X", "O", "X"}
      }

      assert GameState.game_over?(board) == {true, "O"}
    end

    test "returns true and O when O wins using row 3" do
      board = {
        {"X", "X", "O"},
        {"X", "O", "X"},
        {"O", "O", "O"}
      }

      assert GameState.game_over?(board) == {true, "O"}
    end

    test "returns true and O when O wins using column 1" do
      board = {
        {"O", "O", "X"},
        {"O", "X", "O"},
        {"O", "X", "O"}
      }

      assert GameState.game_over?(board) == {true, "O"}
    end

    test "returns true and O when O wins using column 2" do
      board = {
        {"O", "O", "X"},
        {"X", "O", "O"},
        {"X", "O", "X"}
      }

      assert GameState.game_over?(board) == {true, "O"}
    end

    test "returns true and O when O wins using column 3" do
      board = {
        {"X", "X", "O"},
        {"O", "X", "O"},
        {"X", "O", "O"}
      }

      assert GameState.game_over?(board) == {true, "O"}
    end

    test "returns true and O when O wins using the first diagonal" do
      board = {
        {"O", "X", "X"},
        {"O", "O", "X"},
        {"X", "O", "O"}
      }

      assert GameState.game_over?(board) == {true, "O"}
    end

    test "returns true and O when O wins using the second diagonal" do
      board = {
        {"X", "X", "O"},
        {"X", "O", "O"},
        {"O", "O", "X"}
      }

      assert GameState.game_over?(board) == {true, "O"}
    end
  end

  describe "no one wins" do
    test "returns true and no one when the board is full" do
      board = {
        {"X", "O", "X"},
        {"X", "X", "O"},
        {"O", "X", "O"}
      }

      assert GameState.game_over?(board) == {true, "no-one"}
    end
  end
end
