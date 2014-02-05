Weddinglist.LoginFormView = Ember.View.extend
  templateName: 'login_form'
  email: null
  password: null

  submit: (event) ->
    event.preventDefault()
    Weddinglist.Auth.signIn
      user:
        email: @get('email')
        password: @get('password')