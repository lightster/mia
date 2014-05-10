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
  - Foundation 5
  - Ember.js

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

 - Create new time logs (`POST /api/v1/time_logs`)
     - Include associating the time logs to tags
 - Update time logs (`PUT /api/v1/time_logs/:id`)
 - Delete time logs (`DELETE /api/v1/time_logs/:id`)
 - List time logs (`GET /api/v1/time_logs/`)
    - Filtered by time log ID (`{id: ID}`)
    - Retrieve current "timer" timelog (`{timer: true}`)
    - Filtered by date range (`{after_date: AFTER_DATE, before_date: BEFORE_DATE}`)
    - Filtered by category (`{categories: [CATEGORY_ID_1, CATEGORY_ID_2, ...]}`)
    - Filtered by tag (`{tags: [TAG_ID_1, TAG_ID_2, ...]}`)
 - List user tags—that is, tags a user has used (`GET /api/v1/tags`)
 - List categories (`GET /api/v1/categories`)
 - Create categories (`POST /api/v1/categories`)
 - Update categories (`PUT /api/v1/categories/:id`)
 - Delete categories (`DELETE /api/v1/categories/:id`)
