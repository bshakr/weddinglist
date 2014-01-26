Weddinglist.Guest = DS.Model.extend
  name: DS.attr 'string',
  order: (->
    return parseInt(@get('id'), 10)
  ).property('id')
