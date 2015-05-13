($ = jQuery, window, document) ->
  class SimpleScroll
    defaults:
      offset: 0
      duration: 800
      easing: 'swing'

    constructor: (el, options) ->
      @options = $.extend {}, @defaults, options
      @$el = $(el)
      @init()
      @

    init: ->
      @$el.on 'click', @scroll

    scroll: (e) =>
      e.preventDefault()
      _href = $(e.currentTarget).attr('href')
      _top = $(_href).offset().top + @options.offset

      $('html, body')
        .stop()
        .animate
          scrollTop: _top
        ,
          duration: @options.duration
          easing: @options.easing

  $.fn.extend SimpleScroll: (option, args...) ->
    @each ->
      $this = $(@)
      data = $this.data('SimpleScroll')

      if !data
        $this.data 'SimpleScroll', (data = new SimpleScroll(@, option))
      if typeof option == 'string'
        data[option].apply(data, args)
