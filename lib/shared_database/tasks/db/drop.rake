require_relative "../../connection.rb"

Rake::Task["db:drop"].clear if Rake::Task.task_defined?("db:drop")

namespace :db do
    desc "(Shared_Database) Drop the database"
    task :drop do
        case SharedDatabase.db_config['adapter']
        when /mysql/
            SharedDatabase.connect_public_db
            ActiveRecord::Base.connection.drop_database(SharedDatabase.db_config["database"])
            puts "MySQL database deleted."
            abort  # return does not exist
        when /^sqlite/
            File.delete(SharedDatabase.db_config["database"])
            puts "Sqlite database deleted."
            abort
        when 'postgresql'
            SharedDatabase.connect_public_db
            ActiveRecord::Base.connection.drop_database(SharedDatabase.db_config["database"])
            puts "Postgresql database deleted."
            abort
        end

        puts "Database failed to delete..."
    end
end