class CreateNetworks < ActiveRecord::Migration[6.0]
  def change
    create_table :networks do |t|
      t.string :name, null: false
      t.integer :vlan, limit: 2
      t.boolean :use_auth, null: false, default: false
      t.text :note

      t.index :name, unique: true
      t.index :vlan

      t.timestamps
    end
  end
end
