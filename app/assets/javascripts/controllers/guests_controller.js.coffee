Weddinglist.GuestsController = Ember.ArrayController.extend
  sortProperties: ['name'],
  sortAscending: true

  receptionCount:(->
    reception = @filterBy('reception', true)
    total = 0

    for r in reception
      total += r.get('numberOfGuests')

    total
  ).property('@each')

  internationalCount:(->
    international = @filterBy('international', true)
    total = 0

    for i in international
      total += i.get('numberOfGuests')

    total
  ).property('@each')

  churchCount:(->
    guests = @getEach('numberOfGuests')
    if guests.length > 0
      churchCount = guests.reduce (prev, current)-> prev + current
    else
      churchCount = 0
    churchCount

  ).property('@each')

  actions:
    deleteGuest: (id)->
      console.log "delete guest from controller with id : " + id
      deletePromise = @store.find('guest', id)
      deletePromise.then (guest)=>
        guest.deleteRecord()
        guest.save()
    addGuest: ->
      newGuest = String(@get('newGuest'))
      guestsNo = Number(@get('guests'))
      if guestsNo == 0
        guestsNo = 1
      reception = @get('reception')
      international = @get('international')
      inviter = Weddinglist.Auth.get('email')

      guest = @store.createRecord('guest',
        name: newGuest,
        numberOfGuests: guestsNo,
        reception: reception,
        international: international,
        inviter: inviter
      )
      guest.save()
      @set('newGuest', '')
      @set('guests', '')
      @set('reception', false)
      @set('international', false)