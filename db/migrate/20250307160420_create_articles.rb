class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.date :date
      t.string :title
      t.string :author
      t.text :content
      t.string :category
      t.integer :user_id

      t.timestamps
    end
  end
end
