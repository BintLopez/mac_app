# Midwest Access Coalition Volunteer Management Portal
[![Build Status](https://travis-ci.org/MidwestAccessCoalition/mac_app.svg?branch=master)](https://travis-ci.org/MidwestAccessCoalition/mac_app)

## Project Spec
Read about the details and goals for the app [here](https://docs.google.com/document/d/12kksmdvx_QYvset1-sVcDQbEyCf70-3HfdkIVY58d24/edit?usp=sharing)

## Ruby version
* Ruby 2.2.2
* Rails 4.2.6

## Database
* Postgresql

## Local Development
Clone this repo.  
Bundle with `bundle install`  
Create DB `createdb db/development`  
Run migrations with `rake db:migrate`  
Start the server with `bin/rails s`

## Test DB
Simple setup:
```
rake db:test:prepare
```
Manually reset DB:
```
bundle exec rake db:drop RAILS_ENV=test
bundle exec rake db:create RAILS_ENV=test
bundle exec rake db:schema:load RAILS_ENV=test
```

## How to run the test suite
`rspec` or `rake spec`

## Deploy to Heroku
[http://midwestaccess.herokuapp.com/](http://midwestaccess.herokuapp.com/)
