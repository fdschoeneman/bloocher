Bloocher.ShowcasesRoute = Ember.Route.extend(model: ->
  Bloocher.Showcase.find()
)

ShowcaseRoute = Ember.Route.extend(model: ->
  Showcase.find()
)
