#= require jquery
#= require jquery_ujs
#= require foundation
#= require jquery
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require mia

# for more details see: http://emberjs.com/guides/application/
window.Mia = Ember.Application.create()

#= require_tree .

$ ->
  $(document).foundation()
