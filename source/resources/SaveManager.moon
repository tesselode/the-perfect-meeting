class SaveManager
  new: =>
    local options
    if lf.isFile 'options'
      options = lf.load('options')!
    options = options or {}
    with options
      .resolution = .resolution or #ScreenManager.modes
      if .resolution > #ScreenManager.modes
        .resolution = #ScreenManager.modes
      .fullscreen = true if .fullscreen == nil
      .musicVolume = .musicVolume or 1
      .soundVolume = .soundVolume or 1
      .masterVolume = .masterVolume or 1
      ScreenManager.resolution = .resolution
      ScreenManager.fullscreen = .fullscreen
      Tag.Music.volume.v = .musicVolume
      Tag.Sfx.volume.v = .soundVolume
      Tag.Master.volume.v = .masterVolume

    if lf.isFile 'save'
      @records = lf.load('save')!
    @records = @records or {best: {}}

    with @listeners = conversation\newGroup!
      \listen 'won', (time, newBest, gameType) ->
        best = @records.best[gameType]
        if not best or time < best
          @records.best[gameType] = time
        @save!

  save: =>
    options =
      resolution: ScreenManager.resolution
      fullscreen: ScreenManager.fullscreen
      musicVolume: Tag.Music.volume.v
      soundVolume: Tag.Sfx.volume.v
      masterVolume: Tag.Master.volume.v
    lf.write 'options', serialize options
    lf.write 'save', serialize @records

SaveManager!
