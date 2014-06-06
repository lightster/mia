Mia.TimeLog = DS.Model.extend
  description: DS.attr()
  date: DS.attr('date')
  rounded_minutes: DS.attr()
  actual_seconds: DS.attr()
  category: DS.belongsTo 'category', { async: true }

Mia.TimeLog.FIXTURES = [
  {
    id: 100
    description: 'Did some awesome stuff'
    date: new Date()
    rounded_minutes: 1
    actual_seconds: 60
    category: 1
  },
  {
    id: 101
    description: 'Something that took time'
    date: new Date()
    rounded_minutes: 1
    actual_seconds: 60
    category: 1
  }
]