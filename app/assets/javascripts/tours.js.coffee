# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('.tour-details-btn').click ->
    booking_detail = $(@).parent().nextAll('div.booking-details')
    if booking_detail.is(':visible')
      booking_detail.slideUp 'slow'
    else
      booking_detail.hide()
      booking_detail.removeClass 'hidden'
      booking_detail.slideDown 'slow'

  $('.book-tour-btn').click ->
    book_modal = $(@).parent().nextAll('div.booking-form').children('div.modal')
    tour_id = $(@).parent().parent().parent().children('.tour_id').html()
    book_modal.modal({
       remote: '/bookings_modal?tour_id=' + tour_id
    })