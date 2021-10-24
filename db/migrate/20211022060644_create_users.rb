class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :email
      t.string :name
      t.text :image
      t.boolean :admin, :default => false
      t.timestamps
    end
  end
end
