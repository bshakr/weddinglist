Ember.Handlebars.helper('haircut', (string, options)->
  if string.length > 15
    trimmed = string.slice(0, 13) + '...'
    trimmedHtml = '<span class="hint--top" data-hint="'+string+'">'+trimmed+'</span>'
  else

    trimmedHtml = '<span>'+string+'</span>'
  new Ember.Handlebars.SafeString(trimmedHtml)
)
