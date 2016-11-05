class
  new: (@y) =>
    @options = {}
    @selected = 1
    @color = {255, 255, 255}
    @highlightColor = {0, 255, 0}

  addOption: (option) =>
    option.decrement = option.decrement or =>
    option.increment = option.increment or =>
    option.select = option.select or =>
    table.insert @options, option

  update: (dt) =>
    if Input\pressed 'up'
      @selected -= 1
      @selected = #@options if @selected == 0
      conversation\say 'navigate menu'
    if Input\pressed 'down'
      @selected += 1
      @selected = 1 if @selected > #@options
      conversation\say 'navigate menu'
    if Input\pressed 'left'
      @options[@selected].decrement!
      conversation\say 'navigate menu'
    if Input\pressed 'right'
      @options[@selected].increment!
      conversation\say 'navigate menu'
    if Input\pressed 'primary'
      @options[@selected].select!
      conversation\say 'navigate menu'

  draw: =>
    lineHeight = lg.getFont!\getHeight 'TEST'
    y = @y - lineHeight
    for i = 1, #@options
      option = @options[i]
      y += lineHeight
      if i == @selected
        lg.setColor @highlightColor
      else
        lg.setColor @color
      lg.printc option\text!, WIDTH/2, y
