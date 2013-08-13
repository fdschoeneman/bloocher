# For more information see: http://emberjs.com/guides/routing/

# Bloocher.Router.map ()->
  # @resource('posts')

Bloocher.Router.map ->
  @route 'about'
  @resource "showcases",
    path: "/",
    @route "showcase"
      path: "/:showcase_id"
