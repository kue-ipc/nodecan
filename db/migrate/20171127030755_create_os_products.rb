class CreateOsProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :os_products do |t|
      t.string :name
      t.references :os_family, foreign_key: true
      t.boolean :require_security_software

      t.index :name, unique: true

      t.timestamps
    end
  end
end
