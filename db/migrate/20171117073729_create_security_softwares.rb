class CreateSecuritySoftwares < ActiveRecord::Migration[5.1]
  def change
    create_table :security_softwares do |t|
      t.string :name
      t.boolean :has_expiration

      t.timestamps
    end
  end
end
