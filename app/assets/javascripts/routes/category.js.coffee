Mia.CategoryRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'category', params.category_id