class CreateNodes < ActiveRecord::Migration[6.0]
  def change
    create_table :nodes do |t|
      t.string :name, null: false
      t.references :owner, foreign_key: { to_table: :users }
      t.timestamp :confirmed
      t.text :note

      t.index :name

      t.timestamps
    end
  end
end
