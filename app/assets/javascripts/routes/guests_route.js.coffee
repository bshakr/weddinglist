Weddinglist.GuestsRoute = Ember.Route.extend
  beforeModel: -> @transitionTo('login') unless Weddinglist.Auth.get('auth_token')

  model: ->
    @store.find('guest')
