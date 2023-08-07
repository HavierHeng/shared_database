require_relative "../../connection.rb"

Rake::Task["db:create"].clear if Rake::Task.task_defined?("db:create")

namespace :db do
    desc "(Shared_Database) Creates the database"
    task :create do
        begin
            if SharedDatabase.db_config["adapter"] == "postgresql"
                SharedDatabase.connect_public_db
                ActiveRecord::Base.connection.create_database(SharedDatabase.db_config["database"])
            end

            # Sqlite3 does not need to create_database, only Mysql and Postgresql
            puts "Database Created"
        rescue ActiveRecord::ConnectionNotEstablished => err
            puts "Failure to connect: #{err.message}"
        resuce ActiveRecord::C
        end
    end
end