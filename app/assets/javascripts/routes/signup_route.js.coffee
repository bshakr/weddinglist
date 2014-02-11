Weddinglist.SignupRoute = Ember.Route.extend

  actions:
    signedIn: -> @transitionTo('guests')