class CreateOsFamilies < ActiveRecord::Migration[6.0]
  def change
    create_table :os_families do |t|
      t.string :name
      t.integer :order, null: false, default: 0
      t.text :description

      t.index :name, unique: true

      t.timestamps
    end
  end
end
