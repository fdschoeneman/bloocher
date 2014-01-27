# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$(document).ready ->

  $('#winery_producer_name').autocomplete
    source: $('#winery_producer_name').data('autocomplete-source')

  $('#winery_name').autocomplete
    source: $('#winery_name').data('autocomplete-source')

	$("#myCanvasContainer").hide() unless $("#myCanvas").tagcanvas(
    textColour: "grey"
    , outlineColour: "grey"
    , reverse: true
    , depth: 0.8
    , maxSpeed: 0.05
    , wheelZoom: false
    , freezeActive: true
  	, "tags")
