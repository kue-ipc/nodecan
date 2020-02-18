class CreateNodeHadrwares < ActiveRecord::Migration[6.0]
  def change
    create_table :node_hadrwares do |t|
      t.references :node, foreign_key: true
      t.references :node_model, foreign_key: true
      t.string :maker
      t.string :product_name

      t.timestamps
    end
  end
end
