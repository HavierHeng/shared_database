require_relative "../../connection.rb"

Rake::Task["db:migrate"].clear
namespace :db do
    desc "(Shared_Database) Migrate the database"
    task :migrate do
        SharedDatabase.connect_db
        ActiveRecord::Migrator.migrate(SharedDatabase.db_migrations)
        Rake::Task["db:schema"].invoke
        puts "Database migrated."
    end
end