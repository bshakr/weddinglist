Weddinglist.Guest = DS.Model.extend
  name: DS.attr('string'),
  inviter: DS.attr('string'),
  numberOfGuests: DS.attr('number'),
  reception: DS.attr('boolean', {defaultValue: false}),
  international: DS.attr('boolean', {defaultValue: false}),

  order: (->
    parseInt(@get('id'), 10)
  ).property('id')

  inviterUrl: (->
    inviter = @get('inviter')
    url = ''
    if inviter == 'tiakharrat@gmail.com'
      url = 'tia.jpg'
    else if inviter == 'aymankharrat@hotmail.co.uk'
      url = 'ayman.jpg'
    else if inviter == 'bassemreda@gmail.com'
      url = 'bassem.jpg'
    else if inviter == 'Mustardseed.eg@ gmail.com'
      url = 'mona.jpg'
    else
      url = 'rappin.jpeg'
    url
  ).property('inviter')

  receptionClass: (->
    if @get('reception') == true
      receptionClass = 'reception'
    else
      receptionClass = ''
    receptionClass
  ).property('reception')

  internationalClass: (->
    if @get('international') == true
      internationalClass = 'international'
    else
      internationalClass = ''
    internationalClass
  ).property('international')
