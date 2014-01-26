Weddinglist.GuestsRoute = Ember.Route.extend
  model: ->
    @store.find('guest')