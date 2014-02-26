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
    addGuest: ->
      newGuest = String(@get('newGuest'))
      guestsNo = Number(@get('guests'))
      if guestsNo == 0
        guestsNo = 1
      reception = @get('reception')
      console.log "reception: " + reception
      international = @get('international')
      console.log "international: " + international

      guest = @store.createRecord('guest',
        name: newGuest,
        numberOfGuests: guestsNo,
        reception: reception,
        international: international
      )
      guest.save()
      @set('newGuest', '')
      @set('guests', '')
      @set('reception', false)
      @set('international', false)