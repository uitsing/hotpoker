class Item < ApplicationRecord
  belongs_to :room
  has_many :cards
  before_create :generate_name

  private

  def generate_name
    return unless name.blank?

    self.name = 'a new item'
  end
end
