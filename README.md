# README

### Prequisites
- Ruby : 2.6.3
- Rails : 6.0.3.1
- Postgres : 10

### Installation
```shell
$ git clone https://github.com/ag0-es-8h83nlfdkj0/sehatq.git
$ cd ./sehatq
$ gem install pg -v '1.2.3'
$ bundle install
$ rake db:create && rails db:migrate
$ rails s
```

### Configuration
Check at .env

### RSpec
```shell
$ cd ./sehatq
$ rails db:migrate RAILS_ENV=test
$ rspec spec
```