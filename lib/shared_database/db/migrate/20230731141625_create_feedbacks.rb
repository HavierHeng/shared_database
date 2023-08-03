class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.references :user, index: true, foreign_key: true
      t.references :article, index: true, foreign_key: true
      t.integer :relevancy
      t.integer :satisfaction

      t.timestamps null: false
    end
  end
end
