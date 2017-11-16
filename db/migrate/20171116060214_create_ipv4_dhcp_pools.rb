class CreateIpv4DhcpPools < ActiveRecord::Migration[5.1]
  def change
    create_table :ipv4_dhcp_pools do |t|
      t.references :ipv4_network, foreign_key: true
      t.binary :first, null: false, limit: 4
      t.binary :last, null: false, limit: 4

      t.timestamps
    end
  end
end
