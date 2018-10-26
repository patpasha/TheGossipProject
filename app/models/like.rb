class Like < ApplicationRecord

	  has_one :gossip
	  has_one :user, through: :gossip
	  has_one :comment
	  has_one :user, through: :comment
end
