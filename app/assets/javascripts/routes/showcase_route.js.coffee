Bloocher.ShowcaseRoute = Ember.Route.extend(model: ->
  Bloocher.Showcase.find(params.showcase_id)
)