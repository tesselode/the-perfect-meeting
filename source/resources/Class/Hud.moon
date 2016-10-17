class
  new: =>
    @timer = timer.new!

    @message = ''

    @listeners = with conversation\newGroup!
      \listen 'corner bounce', (time) ->
        if time == 0
          Sound.Impact\clone!\play!
        else
          @timer\after 30, ->
            --@message = time..' FRAME DIFFERENCE'
            @message = ''
            for i = 1, 0, -1/7
              if i >= time/60
                @message ..= '\\'
              else
                @message ..= '.'
            Sound.Corner\clone!\play!
            @timer\after 120, ->
              @message = ''

  update: =>
    @timer\update 1

  clear: => conversation\stopListening @listeners

  draw: =>
    with lg
      .setColor 255, 255, 255
      .setFont Font.VcrMedium
      x = WIDTH/2 - Font.VcrMedium\getWidth(@message)/2
      .print @message, x, HEIGHT - 84
