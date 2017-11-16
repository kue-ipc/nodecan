class CreateIpv4DhcpPools < ActiveRecord::Migration[5.1]
  def change
    create_table :ipv4_dhcp_pools do |t|
      t.references :ipv4_network, foreign_key: true, null: false
      t.integer :first, null: false
      t.integer :last, null: false

      t.timestamps
    end
  end
end
