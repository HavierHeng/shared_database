require_relative "../../connection.rb"

if !defined?(Query)
    Dir[File.join(__dir__, "../../", "models", "*.rb")].each { |file| require_relative file }
end

namespace :query do
    desc "(Shared_Database) Adds a new query to be processed into the queries table."
    task :add do
        new_query = ARGV[1] || raise("Specify name: rake query:add your_new_query")
        SharedDatabase.connect_db
        Query.create(query: new_query)
        abort
    end
end