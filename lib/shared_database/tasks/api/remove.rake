require_relative "../../connection.rb"

if !defined?(APIKey)
    Dir[File.join(__dir__, "../../", "models", "*.rb")].each { |file| require_relative file }
end

namespace :api do
    desc "(Shared_Database) Removes an api key from table."
    task :remove do
        old_key = ARGV[1] || raise("Specify name: rake query:remove api_to_be_removed")
        SharedDatabase.connect_db
        APIKey.find_by(api_key: old_key).destroy
        puts "#{old_key} has been removed from API keys."
        abort
    end
end