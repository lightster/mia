Mia.CategoriesRoute = Ember.Route.extend
  model: ->
    @store.findAll 'category'