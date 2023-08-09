require_relative "../../connection.rb"

if !defined?(APIKey)
    Dir[File.join(__dir__, "../../", "models", "*.rb")].each { |file| require_relative file }
end

namespace :api do
    desc "(Shared_Database) Gets all API keys in the api_key table."
    task :list do
        SharedDatabase.connect_db
        puts "All API keys that are to be available:"
        puts "-" * 65
        APIKey.all.each do |api_key|    
            puts api_key.api_key.center(75) + " | " + api_key.usage.to_s.center(10)
        end
    end
end