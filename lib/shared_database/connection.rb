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

    def self.connect_public_db
        begin 
            public_schema_config = Marshal.load(Marshal.dump(SharedDatabase.db_config)).merge({ "database" => "postgres", "schema_search_path" => "public"})
            ActiveRecord::Base.establish_connection(public_schema_config)
        rescue ActiveRecord::AdapterNotSpecified
            puts "Adapter field is missing in database.yml."
        rescue ActiveRecord::AdapterNotFound
            puts "Adapter #{SharedDatabase.db_config["adapter"]} not found. Either try installing the Gem required or checking if adapter was misspelled."
        end
    end

    def self.db_connectable?
        begin
            conncetion = SharedDatabase.connect_public_db  # use default postgres which is guaranteed to be created
            ActiveRecord::Base.connection
            ActiveRecord::Base.connected?
            ActiveRecord::Base.remove_connection(connection)
        rescue
            false  # failure to connect
        end
    end
end