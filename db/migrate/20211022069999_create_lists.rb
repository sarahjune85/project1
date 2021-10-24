class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :description
      t.integer :position
      t.references :board, foreign_key: true
      t.timestamps
    end
  end
end
