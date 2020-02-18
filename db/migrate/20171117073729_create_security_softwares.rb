class CreateSecuritySoftwares < ActiveRecord::Migration[6.0]
  def change
    create_table :security_softwares do |t|
      t.string :name
      t.boolean :has_expiration

      t.index :name, unique: true

      t.timestamps
    end
  end
end
