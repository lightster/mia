Mia.Category = DS.Model.extend
  title: DS.attr()
  time_increment: DS.attr()

Mia.Category.FIXTURES = [
  {
    id: 1
    title: 'Team Support'
    time_increment: 15
  },
  {
    id: 2
    title: 'Bug Development'
    time_increment: 15
  }
]