Weddinglist.IndexRoute = Ember.Route.extend
  beforeModel: ->
    @transitionTo('guests')
