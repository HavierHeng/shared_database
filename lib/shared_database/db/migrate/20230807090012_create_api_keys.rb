  class CreateApiKeys < ActiveRecord::Migration
    def change
      create_table :api_keys do |t|
        t.string :api_key, :comment => "Free tier API key from registering at News API"
        t.integer :usage, :comment => "Daily use count, free tier only has 100 queries per day per key."
        # created_at => Date the API key was added
        # updated_at => Last used date of the API key
        t.timestamps
      end
    end
  end
