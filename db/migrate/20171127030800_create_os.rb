class CreateOs < ActiveRecord::Migration[5.1]
  def change
    create_table :os do |t|
      t.string :name
      t.references :os_product, foreign_key: true
      t.string :version
      t.date :release
      t.date :end_of_life

      t.index :name, unique: true

      t.timestamps
    end
  end
end
