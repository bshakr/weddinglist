#=require base64

Auth = Ember.Object.extend
  auth_token: $.cookie('auth_token')
  email: $.cookie('email')

  signedIn: (->
    @get('auth_token')
  ).property('auth_token')

  signIn: (params) ->
    Ember.$.post('/sessions', params).then (response) =>
      $.cookie('auth_token', response.auth_token)
      $.cookie('email', response.email)

  signup: (params) ->
    Ember.$.post('/users', params).then (response) =>
      $.cookie('auth_token', response.auth_token)
      $.cookie('email', response.email)

  signOut: ->
    promise = Ember.$.ajax '/sessions/destroy',
      type: 'DELETE'

    promise.then =>
      @set('auth_token', null)
      $.removeCookie('auth_token') if $.cookie('auth_token')
      $.removeCookie('email') if $.cookie('email')

Weddinglist.Auth = Auth.create()

$.ajaxSetup(
  beforeSend: (xhr, options) ->
    if Weddinglist.Auth.auth_token
      header = "#{Weddinglist.Auth.get('auth_token')}"
      xhr.setRequestHeader('Authorization', header)
)

