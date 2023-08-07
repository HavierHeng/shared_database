require_relative "../../connection.rb"

if !defined?(APIKey)
    Dir[File.join(__dir__, "../../", "models", "*.rb")].each { |file| require_relative file }
end

namespace :api do
    desc "(Shared_Database) Gets all queries in the queries table."
    task :list do
        SharedDatabase.connect_db
        puts "All API keys that are to be available:"
        puts "-" * 65
        APIKey.all.each do |api_key|    
            puts api_key.api_key.center(30) + " | " + api_key.count.to_s.center(30)
        end
    end
end