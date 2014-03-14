Weddinglist.GuestsController = Ember.ArrayController.extend
  sortProperties: ['name'],
  sortAscending: true,
  filterInternationals: false,
  filterChurch: false

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

  filteredContent:( ->
    content = @get('arrangedContent')
    filterInternationals = @get('filterInternationals')
    filterChurch = @get('filterChurch')
    filterBassem = @get('filterBassem')
    filterTia = @get('filterTia')
    filterReda = @get('filterReda')
    filterMona = @get('filterMona')
    filterAyman = @get('filterAyman')
    if filterInternationals
      filteredContent = content.filter((item)->
        item.get('international')
      )
    else if filterChurch
      filteredContent = content.filter((item) ->
        !item.get('reception')
      )
    else if filterBassem
      filteredContent = content.filter((item) ->
        item.get('inviter') == "bassemreda@gmail.com"
      )
    else if filterTia
      filteredContent = content.filter((item) ->
        item.get('inviter') == "tiakharrat@gmail.com"
      )
    else if filterReda
      filteredContent = content.filter((item) ->
        item.get('inviter') == "redashaker@gmail.com"
      )
    else if filterMona
      filteredContent = content.filter((item) ->
        item.get('inviter') == "Mustardseed.eg@ gmail.com"
      )
    else if filterAyman
      filteredContent = content.filter((item) ->
        item.get('inviter') == "aymankharrat@hotmail.co.uk"
      )
    else
      filteredContent = content
    filteredContent
  ).property('arrangedContent', 'filterInternationals', 'filterChurch', 'filterBassem', 'filterTia', 'filterReda', 'filterMona', 'filterAyman')

  actions:
    filterInternationals: ->
      @set('filterChurch', false)
      @set('filterInternationals', true)

    filterChurch: ->
      @set('filterInternationals', false)
      @set('filterChurch', true)

    filterBassem: ->
      @set('filterBassem', true)
      @set('filterTia', false)
      @set('filterReda', false)
      @set('filterAyman', false)
      @set('filterMona', false)

    filterTia: ->
      @set('filterTia', true)
      @set('filterBassem', false)
      @set('filterReda', false)
      @set('filterAyman', false)
      @set('filterMona', false)

    filterReda: ->
      @set('filterReda', true)
      @set('filterTia', false)
      @set('filterBassem', false)
      @set('filterAyman', false)
      @set('filterMona', false)

    filterMona: ->
      @set('filterMona', true)
      @set('filterReda', false)
      @set('filterTia', false)
      @set('filterBassem', false)
      @set('filterAyman', false)

    filterAyman: ->
      @set('filterAyman', true)
      @set('filterReda', false)
      @set('filterTia', false)
      @set('filterBassem', false)
      @set('filterMona', false)

    clearFilters: ->
      @set('filterInternationals', false)
      @set('filterChurch', false)
      @set('filterBassem', false)

    deleteGuest: (id)->
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