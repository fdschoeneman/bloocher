Bloocher.Router.map ->
  @route 'about'
  @resource "showcases",
    path: "/"
  @resource "showcase",
    path: "/:showcase_id"

  @route "edit_showcase",
    path: "/:showcase_id/edit"

  @route "new_showcase",
    path: "/new"    

