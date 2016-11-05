export WIDTH = 640
export HEIGHT = 480
export DEBUG = false

love.conf = (t) ->
  with t.window
    .fullscreen = true
