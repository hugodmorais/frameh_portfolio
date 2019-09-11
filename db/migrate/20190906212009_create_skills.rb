class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :title
      t.integer :percente_utilized

      t.timestamps
    end
  end
end
