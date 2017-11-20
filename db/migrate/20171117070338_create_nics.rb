class CreateNics < ActiveRecord::Migration[5.1]
  def change
    create_table :nics do |t|
      t.string :name
      t.references :node, foreign_key: true
      t.integer :type, null: false, limit: 1, default: 0
      t.references :network, foreign_key: true
      t.integer :mac_address
      t.integer :ipv4_setting, null: false, limit: 1, default: 0
      t.integer :ipv6_setting, null: false, limit: 1, default: 0
      t.integer :ipv4
      t.binary :ipv6
      t.timestamp :connected

      t.timestamps
    end
  end
end
