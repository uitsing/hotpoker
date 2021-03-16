class Card < ApplicationRecord
  belongs_to :item
  belongs_to :user

  FIB = [0, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, '?'].freeze
  enum status: { fold: 0, reveal: 1 }, _default: :fold

  broadcasts_to :item
end
