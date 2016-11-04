class
  new: =>
    @timer = timer.new!

    @message = ''
    @topText = -> ''
    @bottomText = -> ''

    @messageTimer = nil

    @listeners = with conversation\newGroup!
      \listen 'corner bounce', (time) ->
        unless time == 0
          @timer\cancel @messageTimer if @messageTimer
          @messageTimer = @timer\after 30, ->
            @message = @generateMessage time
            conversation\say 'show timing indicator'
            @messageTimer = @timer\after 120, ->
              @message = ''
      \listen 'won', (time) ->
        @timer\after 120, ->
          @topText = -> 'TIME: ' .. string.format '%.2f', time
          @bottomText = ->
            if Input\getActiveDevice! == 'joystick'
              return 'PRESS A TO CONTINUE'
            else
              return 'PRESS X TO CONTINUE'

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
      .printc @message, WIDTH/2, HEIGHT - 84
      .setColor 0, 255, 0
      .printc @topText!, WIDTH/2, 50
      .printc @bottomText!, WIDTH/2, HEIGHT - 50
