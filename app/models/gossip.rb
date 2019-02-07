class Gossip < ApplicationRecord
  belongs_to :user#, optional: true
	has_many :join_table_gossip_tags
	has_many :tags, through: :join_table_gossip_tags
	has_many :comments
	has_many :likes
	validates :title, presence: true, length: {in: 3..14}
	validates :content, presence: true, length: {maximum: 300}
end
