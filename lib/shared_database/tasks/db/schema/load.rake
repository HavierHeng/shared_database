require_relative "../../../connection.rb"

Rake::Task["db:schema:load"].clear if Rake::Task.task_defined?("db:schema:load")

namespace :db do
  namespace :schema do
    desc '(Shared_Database) Load a schema.rb file into the database from within the gem. Ignores the usual path to schema.rb.'

    task :load do
      SharedDatabase.connect_db
      load(SharedDatabase.db_schema)
    end
  end
end