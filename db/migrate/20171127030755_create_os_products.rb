class CreateOsProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :os_products do |t|
      t.string :name
      t.integer :order, null: false, default: 0
      t.text :description

      t.references :os_family, null: false, foreign_key: true

      t.boolean :require_security_software

      t.index :name, unique: true

      t.timestamps
    end
  end
end
