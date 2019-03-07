Set Up : 

- Open project server directory.

- Run

## Pre-requisites
* Ruby 2.4.1
* PostgreSQL 9.4.4

## Run the app locally

To run the app locally, *Ruby 2.4.1* should be installed, and a *PostgreSQL 9.4.4* server should be running. Then you should be able to install the dependencies by running
```
bundle install

bundle exec rails webpacker:install:react

```

Create and initilize the database with:
```
rake db:setup
rake db:seed
```

### Start

```
bundle exec guard start --no-interactions

```

This will:

 
  * start local Rails server on port 3000
  * start the Webpacker dev server
  * monitor files changes and run [rubocop](docs/rubocop.md) inspections on changes
  * run bundle install when needed

### Test users

Use a@b.de/foobar to log in.