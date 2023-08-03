require File.expand_path("../../../db_config", __FILE__)

namespace :g do
    desc "Generate migration"
    task :migration do
      name = ARGV[1] || raise("Specify name: rake g:migration your_migration")
      timestamp = Time.now.strftime("%Y%m%d%H%M%S")
      path = File.join(SharedDatabase.project_root, "db/migrate/#{timestamp}_#{name}.rb")
      migration_class = name.split("_").map(&:capitalize).join
  
      # Creates a migration at project 
      File.open(path, 'w') do |file|
        file.write <<-EOF
  class #{migration_class} < ActiveRecord::Migration
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