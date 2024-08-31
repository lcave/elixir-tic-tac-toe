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
    render_board(board)
    IO.puts("\n")

    {game_over, winner} = game_over?(board)

    unless(game_over) do
      IO.puts("Player #{current_player}'s turn")
      {new_board, new_player} = play_round(board, current_player)
      play(new_board, new_player)
    else
      IO.puts("Game over! Winner: #{winner}")
    end
  end

  def play_round(board, current_player) do
    {row, col} = get_move()

    case make_move(board, row, col, current_player) do
      {:invalid_move, _} ->
        IO.puts("Invalid move")
        play_round(board, current_player)

      {new_board, new_player} ->
        {new_board, new_player}
    end
  end

  def get_move() do
    input = String.trim(IO.gets("Enter your move: "))
    {row, col} = parse_move(String.split(input, " "))

    if row in [1, 2, 3] and col in [1, 2, 3] do
      {row, col}
    else
      IO.puts("Invalid move: #{input}")
      get_move()
    end
  end

  def parse_move([row, col]) do
    row_num =
      case Integer.parse(row) do
        :error ->
          nil

        {row_num, _} ->
          row_num
      end

    col_num =
      case Integer.parse(col) do
        :error ->
          nil

        {col_num, _} ->
          col_num
      end

    {row_num, col_num}
  end

  def parse_move([_]) do
    {nil, nil}
  end

  def make_move(board, row, col, player) do
    new_player = if player == "X", do: "O", else: "X"

    case update_board(board, row, col, player) do
      {:ok, new_board} ->
        {new_board, new_player}

      {:invalid_move, _} ->
        {:invalid_move, board}
    end
  end

  def update_board(board, row, col, player) do
    row_to_change = elem(board, row - 1)

    case update_row(row_to_change, col, player) do
      {:ok, new_row} ->
        {:ok, put_elem(board, row - 1, new_row)}

      {:invalid_move, _} ->
        {:invalid_move, board}
    end
  end

  def update_row(row, col, player) do
    case elem(row, col - 1) do
      " " ->
        {:ok, put_elem(row, col - 1, player)}

      _ ->
        {:invalid_move, row}
    end
  end

  def render_board(board) do
    {first_row, second_row, third_row} = board

    render_row(first_row)
    IO.puts("---------")
    render_row(second_row)
    IO.puts("---------")
    render_row(third_row)
  end

  def render_row(row) do
    {first, second, third} = row
    IO.puts("#{first} | #{second} | #{third}")
  end

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

      true ->
        {false, ""}
    end
  end

  def x_wins?({"X", "X", "X"}) do
    true
  end

  def x_wins?(_) do
    false
  end

  def o_wins?({"O", "O", "O"}) do
    true
  end

  def o_wins?(_) do
    false
  end

  def transpose_cols(board) do
    {first_row, second_row, third_row} = board
    first_column = {elem(first_row, 0), elem(second_row, 0), elem(third_row, 0)}
    second_column = {elem(first_row, 1), elem(second_row, 1), elem(third_row, 1)}
    third_column = {elem(first_row, 2), elem(second_row, 2), elem(third_row, 2)}
    {first_column, second_column, third_column}
  end

  def transpose_diagonals(board) do
    {first_row, second_row, third_row} = board
    first_diagonal = {elem(first_row, 0), elem(second_row, 1), elem(third_row, 2)}
    second_diagonal = {elem(first_row, 2), elem(second_row, 1), elem(third_row, 0)}
    {first_diagonal, second_diagonal}
  end
end
