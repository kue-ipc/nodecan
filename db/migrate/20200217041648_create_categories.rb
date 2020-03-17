class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.text :description
      t.integer :model, null: false, default: 0
      t.integer :order, null: false, default: 0

      t.timestamps
    end
    add_index :categories, :code
    add_index :categories, [:code, :model], unique: true
    add_index :categories, [:name, :model], unique: true
  end
end
