# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('#modal-open').click()

session = ->
  $('.secondary-link').click (e) ->
    name = $(this).data('region')
    path = "/application/post_city?region=#{name}"
    $.ajaxSetup headers: 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    $.ajax path,
      type: 'POST'
      dataType: 'script'
    setTimeout('location.reload()', 800)

$ ->
  ready()
  session()

$(document).on "page:load", ->
  ready()
  session()
$(document).on "page:change", ->
  ready()
  session()