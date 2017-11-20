class CreateOsTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :os_types do |t|
      t.string :name, null: false
      t.boolean :require_security_software, null: false

      t.index :name, unique: true

      t.timestamps
    end
  end
end
