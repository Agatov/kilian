$ ->

  $('#order-button').bind 'click', ->

    $('.modal-overlay').bind 'click', ->
      hide_thank_you()

    $.post '/orders', {'order[username]': $('input[name=username]').val(), 'order[phone]': $('input[name=phone]').val()}, (data) =>
      $('.modal-overlay').unbind 'click'
      $('.modal-overlay').bind 'click', ->
        hide_thank_you()

    show_thank_you()

    false


  $('#hide-thank-you').bind 'click', ->
    hide_thank_you()
    false

window.show_thank_you = ->

  $('.modal-overlay').show()
  $('.modal-overlay').animate({'opacity': '0.8'}, 300, ->
    $('.modal-thank-you').css('right', '-500px')
    $('.modal-thank-you').css('top', '50%')
    $('.modal-thank-you').show()
    $('.modal-thank-you').animate({'right': '50%'}, 500)

#    $('.modal-overlay').animate {'opacity': '0'}, 300, ->
#      $('.modal-overlay').hide()
  )

window.hide_thank_you = ->
  $('.modal-thank-you').animate {'top': '-2000px'}, 500, ->
    $('.modal-thank-you').hide()
    $('.modal-overlay').animate {'opacity': '0'}, 300, ->
      $('.modal-overlay').hide()