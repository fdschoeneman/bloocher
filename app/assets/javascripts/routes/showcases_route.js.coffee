Bloocher.ShowcasesRoute = Ember.Route.extend(model: ->
  Bloocher.Showcase.find()
)

Bloocher.ShowcasesIndexRoute = Ember.Route.extend(model: ->
  Bloocher.Showcase.find()
)