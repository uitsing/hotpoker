class User < ApplicationRecord
  has_many :rooms
  has_many :cards
  validates :name, presence: true
  before_create :generate_uuid

  def generate_uuid
    loop do
      self.uuid = SecureRandom.uuid
      break unless User.find_by(uuid: uuid)
    end
  end
end
