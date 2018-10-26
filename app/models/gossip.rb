class Gossip < ApplicationRecord

	belongs_to :user, required: false
	has_many :tags
	has_many :comments
	belongs_to :like, required: false
 	has_one :user
end
