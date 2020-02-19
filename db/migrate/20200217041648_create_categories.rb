class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :code
      t.string :name
      t.text :description
      t.integer :model, null: false, default: 0
      t.integer :order

      t.timestamps
    end
    add_index :categories, [:code, :model], unique: true
    add_index :categories, [:name, :model], unique: true
  end
end
