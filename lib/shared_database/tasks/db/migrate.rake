require_relative "../../connection.rb"

namespace :db do
    desc "Migrate the database"
    task :migrate do
        SharedDatabase.connect_db
        ActiveRecord::Migrator.migrate(SharedDatabase.db_migrations)
        Rake::Task["db:schema"].invoke
        puts "Database migrated."
    end
end