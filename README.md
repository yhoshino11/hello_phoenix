# Create Heroku Application
```sh
$ heroku create --buildpack "https://github.com/HashNuke/heroku-buildpack-elixir.git"
```

# Add Buildpack
```sh
$ heroku buildpacks:add https://github.com/gjaldon/heroku-buildpack-phoenix-static.git
```

# Edit config/prod.exs
```elixir
# config/prod.exs
use Mix.Config

config :hello_phoenix, HelloPhoenix.Endpoint,
  http: [port: System.get_env("PORT")],
  url: [scheme: "https", host: "mysterious-meadow-6277.heroku.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/manifest.json"

config :logger, level: :info

config :hello_phoenix, HelloPhoenix.Endpoint,
  secret_key_base: System.get_env("SECRET_KEY_BASE")

config :hello_phoenix, HelloPhoenix.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: 20

# import_config "prod.secret.exs" # Comment out this line.
```

# Set SECRET_KEY_BASE
```sh
$ mix phoenix.gen.secret | pbcopy # Copy to Clipboard
$ heroku config:set SECRET_KEY_BASE="PASTE_HERE"
```

# Deploy to Heroku
```sh
$ git push heroku master
# or $ git push heroku deployment-heroku:master
```

# Migration
```sh
$ heroku run mix ecto.migrate
```

# Check
```sh
$ heroku open
```

# Useful Commands
```sh
$ heroku logs             # Show Application Log
$ heroku run iex -S mix   # Run iex on Heroku
$ heroku run ecto.migrate # Migration
```

# Doing
- [Phoenix - Official Document](http://www.phoenixframework.org/docs/)

# HelloPhoenix

To start your Phoenix app:

  1. Install dependencies with `mix deps.get`
  2. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  3. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
