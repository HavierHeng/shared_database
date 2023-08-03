require_relative "../../connection.rb"

namespace :db do
    desc "Create the database"
    task :create do
        SharedDatabase.connect_db
        begin
            if SharedDatabase.db_config["adapter"] != "sqlite3"
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