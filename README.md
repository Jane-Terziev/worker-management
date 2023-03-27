## Getting started locally

To get started locally, you are required to have postgres, redis and the ruby version specified in the Gemfile.

```ruby
cp .env_sample .env
bundle install
rake db:create db:migrate
rails s
```

## With docker:
If you have docker installed, you need to run the following commands:

```ruby
cp .env_docker_sample .env_docker
docker-compose build
docker-compose run --rm api rake db:create db:migrate
docker-compose up
```