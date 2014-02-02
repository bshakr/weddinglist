Weddinglist.Auth = Ember.Object.create
  auth_token 'hello'

$.ajaxSetup
  beforeSend: (xhr, options) ->
    if Weddinglist.Auth.get('auth_token')
      auth_token = Weddinglist.Auth.get('auth_token')
      header = "Token #{auth_token}"
      xhr.setRequestHeader('Autherization', header)