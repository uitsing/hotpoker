class User < ApplicationRecord
  has_many :rooms
  has_many :cards
  before_create :generate_uuid

  after_update_commit -> { broadcast_replace_later_to [_1, 'name'], partial: 'users/name' }

  def generate_uuid
    loop do
      self.uuid = SecureRandom.uuid
      break unless User.find_by(uuid: uuid)
    end
  end
end
