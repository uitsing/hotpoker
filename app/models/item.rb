class Item < ApplicationRecord
  belongs_to :room
  has_many :cards
end
