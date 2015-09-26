# Important!
## Don't use :async for model tests
###### It causes erratic test results and possibly even deadlocks.

## List of Phoenix Tasks
```sh
$ mix help | grep -i phoenix
mix phoenix.digest      # Digests and compress static files
mix phoenix.gen.channel # Generates a Phoenix channel
mix phoenix.gen.html    # Generates controller, model and views for an HTML based resource
mix phoenix.gen.json    # Generates a controller and model for a JSON based resource
mix phoenix.gen.model   # Generates an Ecto model
mix phoenix.gen.secret  # Generates a secret
mix phoenix.new         # Create a new Phoenix v1.0.2 application
mix phoenix.routes      # Prints all routes
mix phoenix.server      # Starts applications and their servers
```

# Executed Generator
```sh
# Scaffold User
$ mix phoenix.gen.html User users name:string email:string bio:string number_of_pets:integer
```

# List of Ecto Tasks
```sh
$ mix help | grep -i ecto
mix ecto.create         # Create the storage for the repo
mix ecto.drop           # Drop the storage for the repo
mix ecto.gen.migration  # Generate a new migration for the repo
mix ecto.gen.repo       # Generate a new repository
mix ecto.migrate        # Run migrations up on a repo
mix ecto.rollback       # Rollback migrations from a repo
mix phoenix.gen.model   # Generates an Ecto model
```

# Drop Database
```sh
$ mix ecto.drop
```

# Create Database
```sh
$ mix ecto.create
```

# Migration
```sh
$ mix ecto.migrate
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
