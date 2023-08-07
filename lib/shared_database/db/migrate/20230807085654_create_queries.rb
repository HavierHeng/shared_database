  class CreateQueries < ActiveRecord::Migration
    def change
      create_table :queries do |t|
        t.string :query, :comment => "Query string that is used to query News API for metadata"
        t.integer :count, :comment => "Daily query count, also to keep track for daily pagination uses too"
        # created_at => Date the query string was added
        # updated_at => Last queried date of the query
        t.timestamps
      end
    end
  end
