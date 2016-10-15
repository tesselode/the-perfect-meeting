Logo = require 'class.logo'

class
  new: =>
    @logo = Logo!

  update: =>
    @logo\update!

  draw: =>
    with lg
      .setColor 0, 0, 255
      .rectangle 'fill', 0, 0, WIDTH, HEIGHT
    @logo\draw!
