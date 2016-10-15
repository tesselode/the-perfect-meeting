export WIDTH = 320
export HEIGHT = 240

love.conf = (t) ->
  with t.window
    .width = WIDTH * 3
    .height = HEIGHT * 3
