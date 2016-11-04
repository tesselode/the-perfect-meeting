love.load = ->
  require 'resources'

  with gamestate
    .switch State.Title!
    timer.every 1/60, ->
      Input\update!
      .current!\update!

love.update = (dt) ->
  timer.update dt
  SoundManager\update dt

love.keypressed = (key) ->
  with gamestate.current!
    \keypressed key if .keypressed
  ScreenManager\toggleFullscreen! if key == 'f4'
  love.event.quit! if key == 'escape'

love.draw = ->
  with gamestate.current!
    \preDraw! if .preDraw
    ScreenManager\draw -> \draw!
