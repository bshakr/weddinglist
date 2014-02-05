Weddinglist.SignupFormView = Ember.View.extend
  templateName: 'signup_form'
  email: null
  password: null

  submit: (event) ->
    event.preventDefault()
    Weddinglist.Auth.signup
      user:
        email: @get('email')
        password: @get('password')