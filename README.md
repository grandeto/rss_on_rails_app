# Rss On Rails - Simple RSS Feeder
## Pre Requirements: Ruby 2.6.3, Ruby on Rails 5.2.3, PostgreSQL 11.4

### Installation & Configuration

* Create ```config/application.yml``` or Rename ```config/application.yml.example``` to ```application.yml``` and set there your env variables

* Delete ```config/credentials.yml.enc```

* Generate new credentials: 
```EDITOR="nano" bin/rails credentials:edit```

* ```bundle install```

* ```rake db:setup```

* Create Feeds updating cron
```whenever --update-crontab```

* ```rails server```
