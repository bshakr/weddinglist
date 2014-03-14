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
      url = 'tia'
    else if inviter == 'aymankharrat@hotmail.co.uk'
      url = 'ayman'
    else if inviter == 'bassemreda@gmail.com'
      url = 'bassem'
    else if inviter == 'Mustardseed.eg@ gmail.com'
      url = 'reda-mona'
    else if inviter == 'redashaker@gmail.com'
      url = 'reda-mona'
    else
      url = 'rappin'
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
