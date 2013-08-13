Bloocher.ShowcasesRoute = Ember.Route.extend(model: ->
  Bloocher.Showcase.find()
)