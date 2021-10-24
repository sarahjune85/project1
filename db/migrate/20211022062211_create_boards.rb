class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :name
      t.text :image
      t.string :description
      t.references :user, foreign_key: true #null: false,
      t.timestamps
    end
  end
end
