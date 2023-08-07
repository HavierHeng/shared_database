  class RemoveRedundantArticleColumns < ActiveRecord::Migration
    def change
      remove_column :articles, :content, :text
      remove_column :articles, :long_summary, :text
      remove_column :articles, :short_summary, :text
    end
  end
