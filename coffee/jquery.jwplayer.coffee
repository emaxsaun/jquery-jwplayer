$.fn.extend 
  jwplayer: (options, args...) ->
    jwplayer = $(this).data 'jwplayer'
    if jwplayer && typeof options == 'string'
      return jwplayer.trigger(options, args)
    else
      $(this).data 'jwplayer', new JWPlayer( this, options )

class JWPlayer

  constructor: (@elem, options) ->
    frame = $('<div/>', {id: "jwplayer-#{(new Date().getTime())}"})
    elem.wrapInner(frame)
    @instance = jwplayer( frame.get(0) ).setup( options )
    events = ['onBufferChange', 'onBufferFull', 'onError', 'onFullscreen', 'onMeta', 'onMute', 'onPlaylist', 'onPlaylistItem', 'onReady', 'onResize', 'onComplete', 'onSeek', 'onTime', 'onVolume', 'onBeforePlay', 'onBeforeComplete', 'onBuffer', 'onPause', 'onPlay', 'onIdle', 'onBufferChange', 'onBufferFull', 'onError', 'onFullscreen']
    
    $.each events, (index, eventFunction) =>
      @instance[eventFunction].call @instance, (event) =>
        eventName = eventFunction.replace(/^on/, '').replace(/([a-z])([A-Z])/m, "$1-$2").toLowerCase()
        elem.trigger( "jwplayer:#{eventName}" , event )
        
  trigger: (name, args) ->
    @instance[name].apply(@instance, args)
