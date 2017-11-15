class CreateNicTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :nic_types do |t|
      t.string :name
      t.string :display_name
      t.boolean :allow_laa

      t.timestamps
    end
  end
end
