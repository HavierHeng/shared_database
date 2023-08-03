require "active_record"
require "yaml"
require 'dotenv/load'

module SharedDatabase
    def self.project_root
        if defined?(Rails)
            return Rails.root
        end
        
        if defined?(Bundler)
            return Bundler.root
        end
        
        Dir.pwd
    end

    def self.db_config
        # sqlite files are created in <project_root>/db/environment.sqlite3
        yaml = File.join(SharedDatabase.project_root, "config/database.yml")
        environment = ENV["RAILS_ENV"] || ENV["RB_RUNTIME_ENV"] || "development"
        begin
            if File.exist?(yaml)
                require "erb"
                og_config = YAML.load(ERB.new(IO.read(yaml)).result) # parse any ERB code in database.yml, load as Hash

                if og_config.length > 1
                    env_config =  og_config[environment]
                else
                    env_config = og_config
                end

                if env_config["adapter"] == "sqlite3"
                    env_config["database"] = File.join(SharedDatabase.project_root, env_config["database"])
                end
                
                env_config
            elsif ENV['DATABASE_URL']
                ENV['DATABASE_URL']  # URL format: "postgres://myuser:mypass@localhost/somedatabase"
            else
                raise "Could not load database configuration. No such file - #{yaml}"
            end

        rescue Psych::SyntaxError => e
            raise "YAML syntax error occurred while parsing #{paths["config/database"].first}. " \
                "Please note that YAML must be consistently indented using spaces. Tabs are not allowed. " \
                "Error: #{e.message}"
        end
    end
    
    def self.db_migrations
        # migrations is inside the shared library
        File.join(__dir__, "db/migrate/")
    end

    def self.db_schema
        # schema is inside the shared library
        File.join(__dir__, "db/schema.rb")
    end
end