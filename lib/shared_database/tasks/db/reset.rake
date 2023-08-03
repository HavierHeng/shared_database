require_relative "../../connection.rb"

namespace :db do
    desc "Reset the database"
    task :reset => [:drop, :create, :migrate]
end