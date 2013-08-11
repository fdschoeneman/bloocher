//= require handlebars
//= require ember
//= require ember-data
//= require_tree ./models
//= require_tree ./controllers
//= require_tree ./views
//= require_tree ./helpers
//= require_tree ./templates
//= require_tree ./routes
//= require ./router
//= require ./store

Bloocher.Store = DS.Store.extend(
  title: DS.attr('string')
  )

Bloocher.Router.map ->
  @route 'about'
  @resource 'showcases',
    path: "/"
    @route "edit",
      path: "/:showcase_id"



Bloocher.ShowcasesWine = DS.Model.extend(
  showcase: DS.belongsTo('Bloocher.Post')
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

