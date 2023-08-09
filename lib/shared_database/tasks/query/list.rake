require_relative "../../connection.rb"

if !defined?(Query)
    Dir[File.join(__dir__, "../../", "models", "*.rb")].each { |file| require_relative file }
end

namespace :query do
    desc "(Shared_Database) Gets all queries in the queries table."
    task :list do
        SharedDatabase.connect_db
        puts "All queries that are to be performed:"
        puts "-" * 65
        Query.all.each do |query|    
            puts query.query.center(75) + " | " + query.usage.to_s.center(10)
        end
    end
end