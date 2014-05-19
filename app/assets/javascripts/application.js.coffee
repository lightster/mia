#= require jquery
#= require foundation
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require mia

# for more details see: http://emberjs.com/guides/application/
window.Mia = Ember.Application.create()

$ ->
  $(document).foundation()
