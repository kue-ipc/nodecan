class CreateNicTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :nic_types do |t|
      t.string :name, null: false
      t.string :display_name
      t.boolean :allow_laa, null: false, default: false

      t.index :name, unique: true

      t.timestamps
    end
  end
end
