class CreateHardwareTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :hardware_types do |t|
      t.string :code
      t.string :name, null: false
      t.text :description
      t.references :category, foreign_key: true
      t.integer :order, null: false, default: 0

      t.timestamps
    end
    add_index :hardware_types, :code, unique: true
    add_index :hardware_types, :name, unique: true
  end
end
