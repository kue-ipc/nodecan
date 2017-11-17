class CreateDhcpTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :dhcp_types do |t|
      t.string :name, null: false
      t.boolean :managed, null: false, default: false
      t.boolean :reservable, null: false, default: true
      t.boolean :leasable, null: false, default: true

      t.index :name, unique: true

      t.timestamps
    end
  end
end
