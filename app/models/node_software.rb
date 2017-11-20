class NodeSoftware < ApplicationRecord
  belongs_to :node
  belongs_to :os
  belongs_to :security_software
end
