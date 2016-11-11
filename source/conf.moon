export WIDTH = 640
export HEIGHT = 480
export DEBUG = false
export TRAILER = false
export COVER = false

love.conf = (t) ->
  t.identity = 'The Perfect Meeting'
  with t.window
    .title = 'The Perfect Meeting'
    .fullscreen = true
