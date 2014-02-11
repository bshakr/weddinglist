Weddinglist.SignupFormView = Ember.View.extend
  templateName: 'signup_form'
  email: null
  password: null

  submit: (event) ->
    event.preventDefault()
    promise = Weddinglist.Auth.signup
      user:
        email: @get('email')
        password: @get('password')

    promise.then => @get('controller').send('signedIn')
    promise.fail =>
      @set('errorMessage', JSON.parse(response.responseText)['errorMessage'])