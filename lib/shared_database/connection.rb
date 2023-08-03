require_relative "db_config"

module SharedDatabase
    def self.connect_db
        begin 
            ActiveRecord::Base.establish_connection(SharedDatabase.db_config)
        rescue ActiveRecord::AdapterNotSpecified
            puts "Adapter field is missing in database.yml."
        rescue ActiveRecord::AdapterNotFound
            puts "Adapter #{SharedDatabase.db_config["adapter"]} not found. Either try installing the Gem required or checking if adapter was misspelled."
        end
    end

    def self.db_connectable?
        begin
            SharedDatabase.connect_db
            ActiveRecord::Base.connection
            ActiveRecord::Base.connected?
        rescue
            false  # failure to connect
        end
    end
end