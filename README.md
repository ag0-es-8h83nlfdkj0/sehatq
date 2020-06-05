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
$ rake db:create && rails db:migrate && rails db:seed
$ rails s
```

Notes : 
`db:seed` will reset the doctor schedule


### Configuration
Check at .env

### RSpec
```shell
$ cd ./sehatq
$ rails db:migrate RAILS_ENV=test # once
$ rspec spec
```

##### Known issues
Some tests might produce errors "ActionView::Template::Error: Webpacker can't find application in ..." because of webpacker in test env. If this error occurred, run `RAILS_ENV=test bundle exec rails webpacker:compile` before run rspec.