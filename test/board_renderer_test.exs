defmodule BoardRendererTest do
  use ExUnit.Case

  test "renders an empty board" do
    result =
      BoardRenderer.render_board({
        {" ", " ", " "},
        {" ", " ", " "},
        {" ", " ", " "}
      })

    assert String.split(result, "\n") == [
             "   |   |   ",
             "-----------",
             "   |   |   ",
             "-----------",
             "   |   |   "
           ]
  end

  test "renders a populated board" do
    result =
      BoardRenderer.render_board({
        {"X", " ", " "},
        {" ", "O", "O"},
        {"X", " ", "X"}
      })

    assert String.split(result, "\n") == [
             " X |   |   ",
             "-----------",
             "   | O | O ",
             "-----------",
             " X |   | X "
           ]
  end
end
