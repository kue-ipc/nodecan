class CreateIpv4Networks < ActiveRecord::Migration[5.1]
  def change
    create_table :ipv4_networks do |t|
      t.references :network, foreign_key: true
      t.integer :network_type, null: false, limit: 1, default: 0
      t.integer :address, null: false, limit: 5, default: 0
      t.integer :netmask, null: false, limit: 1, default: 24
      t.integer :gateway, limit: 5, default: 0

      t.index :address, unique: true

      t.timestamps
    end
  end
end
