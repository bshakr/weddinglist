# For more information see: http://emberjs.com/guides/routing/

Weddinglist.Router.map ()->
  @resource('guests')
  @route 'login'
  @route 'logout'
  @route 'signup'