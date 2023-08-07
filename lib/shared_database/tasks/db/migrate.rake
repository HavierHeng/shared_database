require_relative "../../connection.rb"

Rake::Task["db:migrate"].clear if Rake::Task.task_defined?("db:migrate")

namespace :db do
    desc "(Shared_Database) Migrate the database"
    task :migrate do
        SharedDatabase.connect_db
        ActiveRecord::Migrator.migrate(SharedDatabase.db_migrations)  # activerecord <5.2
        # ActiveRecord::MigrationContext.new(SharedDatabase.db_migrations).migrate
        Rake::Task["db:schema:load"].invoke
        puts "Database migrated."
    end
end