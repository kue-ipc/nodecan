class CreateIpv6DhcpPools < ActiveRecord::Migration[5.1]
  def change
    create_table :ipv6_dhcp_pools do |t|
      t.references :ipv6_network, foreign_key: true
      t.binary :first, null: false, limit: 16
      t.binary :last, null: false, limit: 16

      t.timestamps
    end
  end
end
