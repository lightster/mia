# For more information see: http://emberjs.com/guides/routing/

Mia.Router.map ()->
  @route 'about'
  @resource 'categories', ->
    @resource 'category',
      path: '/:category_id'
  @resource 'time_logs'