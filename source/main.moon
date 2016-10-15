love.keypressed = (key) ->
  love.event.quit! if key == 'escape'
