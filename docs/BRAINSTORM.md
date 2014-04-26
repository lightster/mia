# Goal

track things you spend your time on

For self-improvement, meant for a single person, not a team.

# Features
  - Timer
    - Have an autofill feature for tags and emojis
    - Keyboard shortcuts
    - saved state
    - Ping you if you leave the timer running
  - Reporting
    - Have a public report link that you can share
    - Aggregates by category and tag over a date range
  - Categories/Projects
  - Description on minutes logged
  - Tags
  - Time increment configuration

# Software Stack
  - Rails
  - SQLite
  - API First
  - Bootstrap

# Thoughts

Should we track the actual times?
  - No, your focus is on the wrong thing, don't waste time
  
How could we make goals or something for specific categories like "development"?  This way we would encourage ourselves to develop more.

# Future?

 - Archive categories using archive tables
 - Ping user when timer has been enabled for a long while
 - Pause timer without stopping it

# Database Structure

### times

 - id
 - user_id
 - category_id
 - description
 - date
 - rounded_minutes
 - actual_seconds
 - timer_enabled
 - created_at
 - updated_at

unique on (user_id, timer_enabled)
constraint on (timer_enabled = true or timer_enabled is null)

### categories

 - id
 - user_id
 - title
 - time_increment
 - created_at
 - updated_at

### tags

 - id
 - title 

unique on (title)

### times_tags

 - id
 - time_id
 - tag_id
 - created_at

unique on (time_id, tag_id)

### users

 - id
 - email
 - password
 - name
 - created_at
 - updated_at

unique on (email)

# Rails Scaffolding

    rails generate scaffold Tag title:string
    rails generate scaffold User email:string:uniq password:string name:string
    rails generate scaffold Category user:belongs_to title:string time_increment:integer
    rails generate scaffold TimeLog user:belongs_to category:belongs_to description:string date:date rounded_minutes:integer actual_seconds:integer timer_enabled:boolean
    rails generate scaffold TimeLogTag time_log:belongs_to tag:belongs_to

# API

Need to be able to

 - Create new time logs
     - Include associating the time logs to tags
 - Update time logs
 - List time logs
    - For a date range
    - For a category
    - For specific tags
    - Retrieve current "timer" timelog
 - List user tags (that is, tags a user has used)
 - Create tags (? this may be unnecessary since time logs can implicitly create tags)
 - Create categories
 - Update categories

 - /api/v1.0
     - ...