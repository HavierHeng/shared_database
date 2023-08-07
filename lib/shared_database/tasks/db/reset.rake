require_relative "../../connection.rb"

Rake::Task["db:reset"].clear if Rake::Task.task_defined?("db:reset")

namespace :db do
    desc "(Shared_Database) Reset the database"
    task :reset => [:drop, :create, :migrate]
end