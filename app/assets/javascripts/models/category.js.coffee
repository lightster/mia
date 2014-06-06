Mia.Category = DS.Model.extend
  title: DS.attr()
  time_increment: DS.attr()
  time_logs: DS.hasMany 'time_log', { async: true }

Mia.Category.FIXTURES = [
  {
    id: 1
    title: 'Team Support'
    time_increment: 15
    time_logs: [100, 101]
  },
  {
    id: 2
    title: 'Bug Development'
    time_increment: 15
  }
]