class CreateNodeSoftwares < ActiveRecord::Migration[6.0]
  def change
    create_table :node_softwares do |t|
      t.references :node, foreign_key: true
      t.references :os_version, foreign_key: true
      t.references :security_software, foreign_key: true
      t.string :hostname

      t.index :hostname

      t.timestamps
    end
  end
end
