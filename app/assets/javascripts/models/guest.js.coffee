Weddinglist.Guest = DS.Model.extend
  name: DS.attr 'string',
  order: (->
    parseInt(@get('id'), 10)
  ).property('id')