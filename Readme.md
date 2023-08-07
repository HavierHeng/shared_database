# Shared Database Custom Gem

## Description

Due to the use of a shared database across multiple applications, the team has deemed it necessary to create a seperate gem which manages all the ActiveRecord models, schemas and migrations, such that it is consistent across all the applications.

Rather than copy-pasting and synchronizing multiple model objects manually, having a gem allows a quick require of the gem, which sets up all the necessary models and databases.

## Components

### Rake tasks

There are 7 rake tasks that override the rake tasks defined by Railties in Rails as specified in [railties.rb](lib/shared_database/railtie.rb). If running in a non-rails environment, these are standalone rake tasks as specified in [Rakefile](lib/shared_database/Rakefile).

| Command          | Function                                               |
| ---------------- | ------------------------------------------------------ |
| rake db:create   | Creates the DB                                         |
| rake db:migrate  | Run migrations                                         |
| rake db:drop     | Delete the DB                                          |
| rake db:reset    | Combination of Create, Migrate and Drop                |
| rake db:schema:dump   | Creates a Schema file of the current DB                |
| rake db:schema:load | Loads the Schema.rb file within the gem into the current DB |
| rake g:migration | Generate a new blank migration file with the timestamp |

Two other custom rake tasks are also included for use of adding queries, and performing some daily cleanup.
| Command          | Function                                               |
| ---------------- | ------------------------------------------------------ |
| rake query:add   | Adds an additional search term to be used to pull articles.                                         |
| rake query:reset  | Resets counter for API Keys and Queries, meant to be called daily.                                         |

### Models

Models are stored in [/lib/shared_database/models directory](lib/shared_database/models).

Any changes to models requires all the projects requiring the gem to `bundle install` again to update their models accordingly.

### Migrations

Migrations are stored in [/lib/shared_database/db/migrate directory](lib/shared_database/db/migrate). New migrations can be generated using `rake g:migration` from within this repo.

Performing `rake g:migration` from a project importing this Gem results in a temporary change that is not synchronized across projects and hence is not recommended to do so.

Any changes to migrations requires all the projects requiring the gem to `bundle install` again to update their models accordingly.
