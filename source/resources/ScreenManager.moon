ScreenManager =
  getScale: => math.min lg.getWidth! / WIDTH, lg.getHeight! / HEIGHT

  updateShaders: =>
    scale = @getScale!
    glow = shine.glowsimple {sigma: 1}
    scalines = shine.scanlines {pixel_size: 4 * scale}
    crt = shine.crt!
    vignette = shine.vignette {radius: 1.25, softness: 1, opacity: .25}
    grain = shine.filmgrain {opacity: .2, grainsize: scale}
    @effect = glow\chain scalines\chain crt\chain vignette\chain grain

  toggleFullscreen: =>
    love.window.setFullscreen not love.window.getFullscreen!
    @updateShaders!

  draw: (f) =>
    with lg
      @effect\draw ->
        .push!
        scale = @getScale!
        .translate (.getWidth! - WIDTH * scale) / 2, 0
        .scale scale
        f!
        .pop!

ScreenManager\updateShaders!

ScreenManager
