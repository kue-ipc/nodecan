class CreateNetworks < ActiveRecord::Migration[5.1]
  def change
    create_table :networks do |t|
      t.string :name, null: false
      t.string :display_name
      t.integer :vlan
      t.references :ipv4_network, foreign_key: true
      t.references :ipv6_network, foreign_key: true
      t.boolean :use_auth, null: false, default: false
      t.text :note

      t.index :name, unique: true

      t.timestamps
    end
  end
end
