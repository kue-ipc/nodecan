class OsTypeNodeModel < ApplicationRecord
  belongs_to :os_type
  belongs_to :node_model
end
