Weddinglist.SignupFormView = Ember.View.extend
  templateName: 'signup_form'
  email: null
  password: null

  submit: (event) ->
    event.preventDefault()
    Weddinglist.Auth.signup
      email: @get('email')
      password: @get('password')