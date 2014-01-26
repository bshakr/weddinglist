Weddinglist.GuestCardComponent = Ember.Component.extend
  didInsertElement:()->
    this.$('.guest').hide().slideDown(280)
