class CreateIpv4Pools < ActiveRecord::Migration[5.1]
  def change
    create_table :ipv4_pools do |t|
      t.references :ipv4_network, foreign_key: true
      t.integer :network_type, null: false, limit: 1, default: 0
      t.binary :first, null: false, limit: 4, deafult: "\0" * 4
      t.binary :last, null: false, limit: 4, deafult: "\0" * 4

      t.timestamps
    end
  end
end
