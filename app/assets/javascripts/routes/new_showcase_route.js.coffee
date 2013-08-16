Bloocher.NewShowcaseRoute = Ember.Route.extend(
  renderTemplate: ->
    @render "edit_showcase",
      controller: "new_showcase"

  model: ->
    showcase.createRecord()

  deactivate: ->
    model = @get("controller.model")
    model.deleteRecord()  unless model.get("isSaving")
)
