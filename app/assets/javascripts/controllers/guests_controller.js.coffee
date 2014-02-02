Weddinglist.GuestsController = Ember.ArrayController.extend
  sortProperties: ['order', 'id'],
  sortAscending: false
  actions:
    addGuest: ->
      newGuest = String(@get('newGuest'))
      console.log newGuest
      guest = @store.createRecord('guest',
        name: newGuest
      )
      guest.save()
      @set('newGuest', '')