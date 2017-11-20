class CreateIpv6Networks < ActiveRecord::Migration[5.1]
  def change
    create_table :ipv6_networks do |t|
      t.references :network, foreign_key: true
      t.integer :type, null: false, limit: 1, default: 0
      t.binary :address, null: false, limit: 16
      t.integer :netmask, null: false, limit: 2
      t.binary :gateway, limit: 16

      t.timestamps
    end
  end
end
