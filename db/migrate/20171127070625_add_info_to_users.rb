class AddInfoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string, null: false
    add_column :users, :display_name, :string
    add_column :users, :ldap, :boolean, null: false, default: false
    add_column :users, :admin, :boolean, null: false, default: false

    add_index :users, :username, unique: true
  end
end
