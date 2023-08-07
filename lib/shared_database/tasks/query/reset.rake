require_relative "../../connection.rb"

namespace :query do
    desc "(Shared_Database) Resets the count for queries and api_keys tables. Intended usage is through a scheduled task daily"
    task :reset do
        SharedDatabase.connect_db
        Query.update(:all, count: 0)
        APIKey.update(:all, count: 0)
    end
end