class CreateOsTypeNodeModels < ActiveRecord::Migration[5.1]
  def change
    create_table :os_type_node_models do |t|
      t.references :os_type, foreign_key: true
      t.references :node_model, foreign_key: true

      t.timestamps
    end
  end
end
