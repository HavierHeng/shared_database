require_relative "../../connection.rb"

if !defined?(Query)
    Dir[File.join(__dir__, "../../", "models", "*.rb")].each { |file| require_relative file }
end

namespace :query do
    desc "(Shared_Database) Removes a query from queries table."
    task :remove do
        old_query = ARGV[1] || raise("Specify name: rake query:remove query_to_be_removed")
        SharedDatabase.connect_db
        Query.destroy_by(query: new_query)
        puts "#{old_query} has been removed from queries."
        abort
    end
end