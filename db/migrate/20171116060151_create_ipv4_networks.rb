class CreateIpv4Networks < ActiveRecord::Migration[5.1]
  def change
    create_table :ipv4_networks do |t|
      t.references :network, foreign_key: true
      t.integer :address, null: false, limit: 5
      t.integer :netmask, null: false, limit: 1
      t.integer :gateway, limit: 5
      t.boolean :use_dhcp, null: false, default: false
      t.references :dhcp_type, foreign_key: true

      t.timestamps
    end
  end
end
