# lib/railtie.rb
# Rake tasks automatically loaded when the gem is required in a Rails app

require 'shared_database'
require 'rails'

module SharedDatabase
  class Railtie < Rails::Railtie
    railtie_name :shared_database

    rake_tasks do
      path = File.expand_path(__dir__)
      Dir.glob("#{path}/tasks/**/*.rake").each { |f| load f }
    end
  end
end