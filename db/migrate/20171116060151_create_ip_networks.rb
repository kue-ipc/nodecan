class CreateIpNetworks < ActiveRecord::Migration[6.0]
  def change
    create_table :ip_networks do |t|
      t.references :network, foreign_key: true
      t.integer :network_type, null: false, limit: 1, default: 0
      t.cidr :address, null: false
      t.inet :gateway, default: nil

      t.index :address

      t.timestamps
    end
  end
end
