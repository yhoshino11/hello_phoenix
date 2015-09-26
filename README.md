# Production
## Compiling Assets
```sh
$ npm install -g brunch
$ brunch build --production
$ MIX_ENV=prod mix phoenix.digest
```

## Starting Server in Production
```sh
$ PORT=4001 MIX_ENV=prod mix phoenix.server # http://localhost:4001
# $ PORT=4001 MIX_ENV=prod iex -S mix phoenix.server # Interactive Shell
# $ MIX_ENV=prod PORT=4001 elixir --detached -S mix do compile, phoenix.server # daemonize
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
