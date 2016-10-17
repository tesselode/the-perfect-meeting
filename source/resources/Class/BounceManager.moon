bounceTime = 60

class
  new: =>
    @bounceTimer = nil
    @bounceType = nil

    with @listeners = conversation\newGroup!
      \listen 'bounce', (side) -> @registerBounce side

  update: =>
    if @bounceTimer
      @bounceTimer -= 1
      if @bounceTimer == 0
        @bounceTimer = nil
        @bounceType = nil

  registerBounce: (side) =>
    local type
    type = 'horizontal' if side == 'left' or side == 'right'
    type = 'vertical' if side == 'top' or side == 'bottom'

    if @bounceType == 'horizontal' and type == 'vertical' or @bounceType == 'vertical' and type == 'horizontal'
      time = bounceTime - @bounceTimer
      conversation\say 'corner bounce', time
      @bounceType = nil
      @bounceTimer = nil
    else
      @bounceType = type
      @bounceTimer = bounceTime

  clear: =>
    conversation\stopListening @listeners
