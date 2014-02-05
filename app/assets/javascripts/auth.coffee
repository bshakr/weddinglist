#=require base64
Weddinglist.Auth = Ember.Object.create
  signIn: (params) ->
    Ember.$.post('/sessions', params).then (response) =>
      @set('auth_token', response.auth_token)
  signup: (params) ->
    Ember.$.post('/users', params).then (response) =>
      @set('auth_token', response.auth_token)
$.ajaxSetup(
  beforeSend: (xhr, options) ->
    if Weddinglist.Auth.get('auth_token')
      header = "#{Weddinglist.Auth.get('auth_token')}"
      xhr.setRequestHeader('Authorization', header)
)