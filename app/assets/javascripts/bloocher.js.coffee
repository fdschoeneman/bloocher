#= require jquery
#= require jquery_ujs
#= require jquery.ui.datepicker
#= require bootstrap
#= require jquery.localscroll-1.2.7-min
#= require jquery.validate
#= require jquery.validate.functions
#= require handlebars
#= require ember
#= require ember-data
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./routes
#= require ./router
#= require router
#= require_self
#= require custom

Bloocher = Ember.Application.create(LOG_TRANSITIONS: true)

Bloocher.Store = DS.Store.extend(
  title: DS.attr('string')
  )

Bloocher.Router.map ->
  @route 'about'
  @resource 'showcases',
    path: "/"
  @resource 'showcases_wines'

Bloocher.Showcase = DS.Model.extend(
  name: DS.attr("string")
)

Bloocher.ShowcasesRoute = Ember.Route.extend(model: ->
  Bloocher.Showcase.find()
)



Bloocher.ShowcaseRoute = Ember.Route.extend({

})

Bloocher.ShowcasesController = Ember.ArrayController.extend({

})

Bloocher.ShowcaseController = Ember.Controller.extend({

})

Bloocher.ShowcasesView = Ember.View.extend
  templateName: 'showcases'

Bloocher.ShowcaseView = Ember.View.extend
  templateName: 'showcase'

