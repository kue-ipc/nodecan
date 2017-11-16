class CreateIpv4Networks < ActiveRecord::Migration[5.1]
  def change
    create_table :ipv4_networks do |t|
      t.integer :address, null: false
      t.integer :netmask, null: false
      t.integer :gateway
      t.boolean :use_dhcp, null: false, default: false
      t.references :dhcp_type, foreign_key: true

      t.timestamps
    end
  end
end
