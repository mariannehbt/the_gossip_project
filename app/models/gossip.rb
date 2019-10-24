class Gossip < ApplicationRecord
  belongs_to :user
  has_many :tags, through: :join_table_gossips_tags
end
