Weddinglist.LogoutRoute = Ember.Route.extend
  activate: ->
    Weddinglist.Auth.signOut().then =>
      @transitionTo('login')