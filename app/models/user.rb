class User < ApplicationRecord
  has_many :rooms

  def generate_uuid
    self.uuid = SecureRandom.uuid while uuid.nil? || User.find_by(uuid: uuid)
  end
end
