require_relative "../../connection.rb"

namespace :db do
    desc "Drop the database"
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