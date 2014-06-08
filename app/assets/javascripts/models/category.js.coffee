Mia.Category = DS.Model.extend
  title: DS.attr()
  timeIncrement: DS.attr()
  timeLogs: DS.hasMany 'time_log', { async: true }
  color: DS.attr()
  bgColor: (->
    "bg-#{this.get('color')}"
  ).property('color')

Mia.Category.FIXTURES = [
  {
    id: 1
    title: 'Team Support'
    time_increment: 15
    time_logs: [100, 101]
    color: 'blue'
  },
  {
    id: 2
    title: 'Bug Development'
    time_increment: 15
    color: 'green'
  }
]