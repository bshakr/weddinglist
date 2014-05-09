Weddinglist.GuestCardComponent = Ember.Component.extend
  didInsertElement:()->
    this.$('.guest').addClass('animated bounceIn')
  actions:
    deleteGuest:(id) ->
      controller = Weddinglist.__container__.lookup("controller:guests");
      controller.send('deleteGuest',id);
      #@sendAction('action')
      #console.log "Delete guest from component with id: " + id
