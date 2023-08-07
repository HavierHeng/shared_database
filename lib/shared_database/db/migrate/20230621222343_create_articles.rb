class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      # t.string :id  # id is implicit primary key column
      t.string :identifier, :limit => 512, :comment => "Identifier for source of article"
      t.string :name, :limit => 512, :comment => "Display name for the source of article"
      t.string :author, :limit => 512, :comment => "Author of the article"
      t.string :title, :limit => 1024, :comment => "Article headline or title", :null => false
      t.text :description, :comment => "A description or snippet from the article", :null => false
      t.string :url, :limit => 2048, :comment => "Direct URL to the article", :null => false
      t.string :url_to_image, :limit => 2048, :comment => "URL to a relevant image for the article"
      t.datetime :published_at, :comment => "The date and time that the article was published in UTC +00"
      t.text :content, :comment => "Unformatted content from the article where available, truncated to 200 chars."
      t.text :short_summary, :comment => "Short summary of the article"
      t.text :long_summary, :comment => "Detail summary of the article"
      t.string :category, :comment => "Category of the article"

      t.timestamps  # macro for created_at and updated_at for entry
    end
  end
end
