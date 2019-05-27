## About ##

This is a Ruby on Rails application that provides a simple, opinionated, novel knowledge base system.

## Development ##

A Docker (Compose) based development configuration is included. To get started,
you'll need Docker and Docker Compose installed. Once this is taken care of,
you can create your development/testing environment like so:

```
docker-compose build
```

Once this finishes, the easiest way to interact with the dev environment is with the `bin/dev` script. With no arguments, `bin/dev` starts an interactive shell in the development container. Any arguments given to the script are considered a command to run within the container.

### Examples ###

* Run an interactive shell: `bin/dev`
* Run database migrations: `bin/dev bundle exec rake db:migrate`

### Notes ###

* As of May 2019, this application is configured via environment variables so as to fit into the 12-factor application paradigm. To that end, when hacking on the project, any config files that you add should reference environment variables rather than hard values, and those environment variables should be listed as requirements in `config/initializers/figaro.rb` to ensure that their omission results in an initialization error rather than a runtime error.
* On the other hand, if you prefer runtime errors to initialization errors for some reason, you can omit/remove items from `config/initializers/figaro.rb` to make that happen.
* See `config/database.yml` and `config/secrets.yml` for an example of how one might set up environment variable configuration.

## Production ##

A Docker based production configuration is included. To get started, you'll need Docker installed locally as well as an account on a repository to which you can push images. Once all of that is taken care of, the release process is like so (assuming you've set up local access to your repo):

1. Build a tagged image: `docker build -t <your-repo-username>/smart_aleck-rails:<build-version>`
2. Push your image: `docker push <your-repo-username>/smart_aleck-rails:<build-version>`
3. Instruct your container orchestrator to use the new version of the image

## History ##

* 0.0.18
* 0.0.17
* 0.0.16
* 0.0.15
* 0.0.14
* 0.0.13
* 0.0.12
* 0.0.11
* 0.0.10
* 0.0.9
* 0.0.8
* 0.0.7
* 0.0.6
* 0.0.5
* 0.0.4
* 0.0.3
* 0.0.2
* 0.0.1
