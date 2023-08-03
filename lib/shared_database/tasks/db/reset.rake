require_relative "../../connection.rb"

Rake::Task["db:reset"].clear
namespace :db do
    desc "(Shared_Database) Reset the database"
    task :reset => [:drop, :create, :migrate]
end