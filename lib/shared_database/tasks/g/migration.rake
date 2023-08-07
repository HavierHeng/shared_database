require File.expand_path("../../../db_config", __FILE__)

Rake::Task["g:migration"].clear if Rake::Task.task_defined?("g:migration")

namespace :g do
    desc "(Shared Database) Generate migrations within the Gem itself. Ignores usual path to migrations."
    task :migration do
      name = ARGV[1] || raise("Specify name: rake g:migration your_migration")
      timestamp = Time.now.strftime("%Y%m%d%H%M%S")
      path = File.join(SharedDatabase.db_migrations, "#{timestamp}_#{name}.rb")
      migration_class = name.split("_").map(&:capitalize).join
  
      # Creates a migration at project 
      File.open(path, 'w') do |file|
        file.write <<-EOF
  class #{migration_class} < ActiveRecord::Migration[5.2]
    def self.up
    end
    def self.down
    end
  end
        EOF
      end
  
      puts "Migration #{path} created"
      abort # needed stop other tasks
    end
  end