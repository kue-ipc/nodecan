class CreateOsFamilies < ActiveRecord::Migration[6.0]
  def change
    create_table :os_families do |t|
      t.string :name

      t.index :name, unique: true

      t.timestamps
    end
  end
end
