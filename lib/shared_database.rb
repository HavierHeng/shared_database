# Entry point when gem is required
# Sets up railtie.rb if Rails is available, else use Rakefile if Rails is unavailable

module SharedDatabase
    require_relative "shared_database/railtie" if defined?(Rails)
    require_relative "shared_database/version"
    require_relative "shared_database/db_config"
    require_relative "shared_database/connection"

    # Set up a connection pool, and then connect to model
    # require all models in shared_database/models
    if SharedDatabase.db_connectable?
        Dir[File.join(__dir__, "shared_database", "models", "*.rb")].each { |file| require_relative file }
        puts "Models have been imported"
    else
        puts "Failed to import models"
    end
end