Mia.TimeLogsRoute = Ember.Route.extend
  model: ->
    @store.findAll 'time_log'