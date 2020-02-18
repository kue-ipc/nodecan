class CreateOsVersions < ActiveRecord::Migration[6.0]
  def change
    create_table :os_versions do |t|
      t.string :name
      t.integer :order, null: false, default: 0
      t.text :description

      t.references :os_product, null: false, foreign_key: true

      t.string :version
      t.date :release
      t.date :end_of_life

      t.index :name, unique: true

      t.timestamps
    end
  end
end
