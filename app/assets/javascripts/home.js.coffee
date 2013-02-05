# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->

	$('#jenny-beck').popover( { 
		trigger: 'hover' 
		, placement: 'left'
		, title: "definition: jenny beck"
		, content: "a tattletale; a stool pigeon: Jenny Beck was a local gossiper and told many tall-tales."} )

	$('#tidrick').popover( { trigger: 'hover', placement: 'top'
		, title: "definition: tidrick"
		, content: "a party; a social gathering."} )