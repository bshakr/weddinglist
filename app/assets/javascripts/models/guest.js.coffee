Weddinglist.Guest = DS.Model.extend
  name: DS.attr('string'),
  numberOfGuests: DS.attr('number'),
  reception: DS.attr('boolean', {defaultValue: false}),
  international: DS.attr('boolean', {defaultValue: false}),
  order: (->
    parseInt(@get('id'), 10)
  ).property('id')
  receptionClass: (->
    if @get('reception') == true
      receptionClass = 'reception'
    else
      receptionClass = ''
    receptionClass
  ).property('reception')