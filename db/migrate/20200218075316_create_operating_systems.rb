class CreateOperatingSystems < ActiveRecord::Migration[6.0]
  def change
    create_table :operating_systems do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.text :description
      t.references :category, foreign_key: true
      t.integer :order, null: false, default: 0
      t.date :end_of_life

      t.timestamps
    end
    add_index :operating_systems, :code, unique: true
    add_index :operating_systems, :name, unique: true
  end
end
