Logo = require 'class.logo'

class
  new: =>
    @timer = timer.new!
    with @group = conversation\newGroup!
      \listen 'corner bounce', (time) ->
        @timer\after 20, ->
          --@message = time..' FRAME DIFFERENCE'
          @message = ''
          for i = 1, 0, -1/7
            if i >= time/60
              @message ..= '\\'
            else
              @message ..= '.'
          @timer\after 120, ->
            @message = ''

    @message = ''
    @logo = Logo!
    Sound.Hum\play!

  update: =>
    @timer\update 1
    @logo\update!

  leave: =>
    conversation\stopListening @listeners

  draw: =>
    with lg
      .setColor 0, 0, 255
      .rectangle 'fill', 0, 0, WIDTH, HEIGHT
      .setColor 255, 255, 255
      .setFont Font.VCR
      x = WIDTH/2 - Font.VCR\getWidth(@message)/2
      .print @message, x, HEIGHT - 84
    @logo\draw!
