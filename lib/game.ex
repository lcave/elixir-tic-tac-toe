defmodule Game do
  def start do
    IO.puts("Game starting\n")

    Game.play(
      {
        {" ", " ", " "},
        {" ", " ", " "},
        {" ", " ", " "}
      },
      "X"
    )
  end

  def play(board, current_player) do
    IO.puts("\n")
    IO.puts(BoardRenderer.render_board(board))
    IO.puts("\n")

    {game_over, winner} = GameState.game_over?(board)

    unless(game_over) do
      IO.puts("Player #{current_player}'s turn")
      {new_board, new_player} = play_round(board, current_player)
      play(new_board, new_player)
    else
      IO.puts("Game over! Winner: #{winner}")
    end
  end

  def play_round(board, current_player) do
    case MoveParser.parse_move(
           board,
           IO.gets("Enter your move: ")
         ) do
      {:invalid_move, _} ->
        IO.puts("Invalid move")
        play_round(board, current_player)

      {row, col} ->
        make_move(board, row, col, current_player)
    end
  end

  def make_move(board, row, col, player) do
    new_player = if player == "X", do: "O", else: "X"

    {
      MoveExecutor.execute_move(board, {row, col}, player),
      new_player
    }
  end
end
