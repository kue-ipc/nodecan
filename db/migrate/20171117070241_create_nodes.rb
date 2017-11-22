class CreateNodes < ActiveRecord::Migration[5.1]
  def change
    create_table :nodes do |t|
      t.string :name, null: false
      t.references :user, foreign_key: true
      t.timestamp :confirmed
      t.text :note

      t.index :name
      t.index :user

      t.timestamps
    end
  end
end
