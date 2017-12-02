class CreateIpv4Pools < ActiveRecord::Migration[5.1]
  def change
    create_table :ipv4_pools do |t|
      t.references :ipv4_network, foreign_key: true
      t.integer :type, null: false, limit: 1, default: 0
      t.integer :first, null: false, limit: 5
      t.integer :last, null: false, limit: 5

      t.timestamps
    end
  end
end
