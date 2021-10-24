class CreateSnippets < ActiveRecord::Migration[6.1]
  def change
    create_table :snippets do |t|
      t.string :title
      t.string :description
      t.text :code_block
      t.boolean :pinned
      t.integer :position
      t.references :list, foreign_key: true
      t.timestamps
    end
  end
end
