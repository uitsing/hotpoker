class Card < ApplicationRecord
  FIB = [0, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89].freeze
  belongs_to :item
  enum status: { fold: 0, reveal: 1 }
end
