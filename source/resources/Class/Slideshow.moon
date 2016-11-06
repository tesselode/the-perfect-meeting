class
  new: =>
    @slide = 1

    @slides = {
      ->
      ->
        lg.setColor 255, 255, 255
        lg.print 'FROM THE DEVELOPER\nOF GAMES LIKE', 16, HEIGHT/4
        lg.setColor 0, 255, 0
        lg.print 'THE TOPS DON\'T STING YOU', 16, HEIGHT/4 + 42*3
        lg.setColor 255, 255, 255
        lg.print 'AND THAT\'S IT', 16, HEIGHT/4 + 42*5
      ->
      ->
        lg.setColor 255, 255, 255
        lg.print 'COMES A REVOLUTIONARY\nNEW GAMING EXPERIENCE', 16, HEIGHT/4
      ->
      ->
        lg.setColor 255, 255, 255
        lg.print '   PRESENTING...', 16, HEIGHT/4
        lg.setColor 0, 255, 0
        lg.print '/\\ THE PERFECT MEETING', 16, HEIGHT/4 + 42*2
      ->
      ->
        lg.setColor 255, 255, 255
        lg.print '60 HOURS OF\nEXHILIRATING GAMEPLAY', 16, HEIGHT/4
      ->
      ->
        lg.setColor 255, 255, 255
        lg.print 'DEEP TACTICS\nAND STRATEGY', 16, HEIGHT/4
      ->
      ->
        lg.setColor 255, 255, 255
        lg.print 'MULTIPLE GAME MODES', 16, HEIGHT/4
        lg.setColor 0, 255, 0
        lg.print 'GAME A', 16, HEIGHT/4 + 42
      ->
        lg.setColor 255, 255, 255
        lg.print 'MULTIPLE GAME MODES', 16, HEIGHT/4
        lg.setColor 0, 255, 0
        lg.print 'GAME B', 16, HEIGHT/4 + 42
      ->
      ->
        lg.setColor 0, 255, 0
        lg.print '/\\ THE PERFECT MEETING', 16, HEIGHT/4
        lg.setColor 0, 255, 255
        lg.print '   TESSELODE.\n   ITCH.\n   IO', 16, HEIGHT/4 + 42*2
    }


  keypressed: (key) =>
    if key == 'p' then
      @slide += 1 if @slide < #@slides
    if key == 's' then
      @slide = 1

  draw: =>
    lg.setFont Font.VcrMedium
    @slides[@slide]!
