class CreateOsFamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :os_families do |t|
      t.string :name
      t.boolean :require_security_software

      t.index :name, unique: true

      t.timestamps
    end
  end
end
