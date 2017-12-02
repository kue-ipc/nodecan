class CreateUserNetworks < ActiveRecord::Migration[5.1]
  def change
    create_table :user_networks do |t|
      t.references :user, foreign_key: true
      t.references :network, foreign_key: true
      t.boolean :default
      t.boolean :assignable

      t.timestamps
    end
  end
end
