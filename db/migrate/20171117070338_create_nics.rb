class CreateNics < ActiveRecord::Migration[5.1]
  def change
    create_table :nics do |t|
      t.string :name
      t.references :node, foreign_key: true
      t.references :nic_type, foreign_key: true
      t.references :network, foreign_key: true
      t.integer :mac_address
      t.references :ipv4_setting, foreign_key: { to_table: :ip_settings }
      t.references :ipv6_setting, foreign_key: { to_table: :ip_settings }
      t.integer :ipv4
      t.binary :ipv6
      t.timestamp :connected

      t.timestamps
    end
  end
end
