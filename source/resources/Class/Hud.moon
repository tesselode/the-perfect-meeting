class
  new: =>
    @timer = timer.new!

    @message = ''

    @listeners = with conversation\newGroup!
      \listen 'corner bounce', (time) ->
        unless time == 0
          @timer\after 30, ->
            @message = @generateMessage time
            conversation\say 'show timing indicator'
            @timer\after 120, ->
              @message = ''

  generateMessage: (time) =>
    message = ''
    for i = 1, 0, -1/7
      if i >= time/60
        message ..= '\\'
      else
        message ..= '.'
    message

  update: =>
    @timer\update 1

  clear: => conversation\stopListening @listeners

  draw: =>
    with lg
      .setColor 255, 255, 255
      .setFont Font.VcrMedium
      x = WIDTH/2 - Font.VcrMedium\getWidth(@message)/2
      .print @message, x, HEIGHT - 84
