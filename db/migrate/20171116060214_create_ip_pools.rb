class CreateIpPools < ActiveRecord::Migration[6.0]
  def change
    create_table :ip_pools do |t|
      t.references :ip_network, foreign_key: true
      t.integer :network_type, null: false, limit: 1, default: 0
      t.inet :first, null: false
      t.inet :last, null: false

      t.timestamps
    end
  end
end
