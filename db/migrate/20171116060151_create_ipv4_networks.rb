class CreateIpv4Networks < ActiveRecord::Migration[5.1]
  def change
    create_table :ipv4_networks do |t|
      t.references :network, foreign_key: true
      t.binary :address, null: false, limit: 4
      t.integer :netmask, null: false, limit: 1
      t.binary :gateway, limit: 4
      t.boolean :use_dhcp, null: false, default: false
      t.references :dhcp_type, foreign_key: true

      t.timestamps
    end
  end
end
