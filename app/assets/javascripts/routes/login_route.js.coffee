Weddinglist.LoginRoute = Ember.Route.extend

  actions:
    signedIn: -> @transitionTo('guests')