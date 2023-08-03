require_relative "../../connection.rb"

namespace :db do
    desc 'Create a db/schema.rb file that is portable against any database supported by ACtiveRecord'

    task :schema do
      SharedDatabase.connect_db
      require 'active_record/schema_dumper'

      File.open(SharedDatabase.db_schema, "w:utf-8") do |file|
        ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
      end
    end
end