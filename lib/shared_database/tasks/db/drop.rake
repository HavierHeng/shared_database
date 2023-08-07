require_relative "../../connection.rb"

Rake::Task["db:drop"].clear if Rake::Task.task_defined?("db:drop")

namespace :db do
    desc "(Shared_Database) Drop the database"
    task :drop do
        SharedDatabase.connect_db
        if SharedDatabase.db_config["adapter"] != "sqlite3"
            ActiveRecord::Base.connection.drop_database(db_config["database"])
        else  # sqlite3 drop db is basically deleting the file
            File.delete(SharedDatabase.db_config["database"])
        end
        puts "Database deleted."
    end
end