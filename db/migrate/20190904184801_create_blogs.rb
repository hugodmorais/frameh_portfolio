class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.integer :status, default: 0
      t.string :slug
      t.references :topic, foreign_key: true

      t.timestamps
    end
    add_index :blogs, [:slug], unique: true
  end
end
