class CreateIpSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :ip_settings do |t|
      t.string :name, null: false
      t.boolean :require_address, null: false
      t.boolean :require_dhcp, null: false
      t.boolean :register_reservation, null: false

      t.index :name, unique: true

      t.timestamps
    end
  end
end
