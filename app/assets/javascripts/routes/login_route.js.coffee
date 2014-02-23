Weddinglist.LoginRoute = Ember.Route.extend
  activate: ->
    if Weddinglist.Auth.auth_token
      @transitionTo('guests')
  actions:
    signedIn: ->
      if Weddinglist.Auth.auth_token
        @transitionTo('guests')