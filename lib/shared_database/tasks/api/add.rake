require_relative "../../connection.rb"

if !defined?(APIKey)
    Dir[File.join(__dir__, "../../", "models", "*.rb")].each { |file| require_relative file }
end

namespace :api do
    desc "(Shared_Database) Adds an api key to the queries table."
    task :add do
        new_key = ARGV[1] || raise("Specify name: rake api:add your_new_key")
        SharedDatabase.connect_db
        APIKey.create(api_key: new_key)
        puts "#{new_key} has been added to API Key."
        abort
    end
end