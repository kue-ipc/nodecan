class CreateNetworkUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :network_users do |t|
      t.references :network, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :default, null: false, default: false
      t.boolean :assignable, null: false, default: true

      t.timestamps
    end
  end
end
