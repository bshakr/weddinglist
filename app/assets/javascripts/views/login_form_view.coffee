Weddinglist.LoginFormView = Ember.View.extend
  templateName: 'login_form'
  email: null
  password: null

  submit: (event) ->
    event.preventDefault()
    @set('errorMessage', null)
    promise = Weddinglist.Auth.signIn
      user:
        email: @get('email')
        password: @get('password')
    promise.then => @get('controller').send('signedIn')
    promise.fail =>
      @set('errorMessage', JSON.parse(response.responseText)['errorMessage'])