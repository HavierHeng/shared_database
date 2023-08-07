require_relative "../../connection.rb"

if !defined?(Query)
    Dir[File.join(__dir__, "../../", "models", "*.rb")].each { |file| require_relative file }
end

namespace :query do
    desc "(Shared_Database) Resets the count for queries and api_keys tables. Intended usage is through a scheduled task daily"
    task :reset do
        SharedDatabase.connect_db
        Query.update_all(count: 0)
        APIKey.update_all(count: 0)
        puts "Resetted all queries and api key usages to 0, printing updated values..."
        Rake::Task["api:list"].invoke
        Rake::Task["query:list"].invoke
    end
end