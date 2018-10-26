class User < ApplicationRecord

	belongs_to :ville, required: false
	has_many :gossips
	has_many :commentaires
	belongs_to :gossip, required: false
 	belongs_to :comment, required: false
end
