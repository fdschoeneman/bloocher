Bloocher.Router.map ->
  @route 'about'
  @resource "showcases", 
    path: "/", ->
    @route "showcase",
      path: "/:showcase_id"
    @route "new"

