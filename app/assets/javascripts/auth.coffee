#=require base64
Weddinglist.Auth = Ember.Object.create
  auth_token: 'hello'
  signIn: (params) ->
    Ember.$.post('/sessions', params).then (response) =>
      @set('auth_token', response.auth_token)

$.ajaxSetup(
  headers: { 'x-my-custom-header': 'some value' }
  beforeSend: (xhr, options) ->
    encoded_auth_token = Base64.encode64(Weddinglist.Auth.get('auth_token') + ":#X")
    header = "Token #{encoded_auth_token}"
    xhr.setRequestHeader('Authorization', header)
)