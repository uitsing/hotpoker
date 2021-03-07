class Room < ApplicationRecord
  belongs_to :user
  has_many :items
  # broadcasts_to :broadcasts_target, target: private ? broadcast_target_default : :public_rooms
  after_create_commit  :action_later
  after_update_commit  :replace_later
  after_destroy_commit :remove_later

  private

  def action_later
    broadcast_action_later_to 'public_rooms', action: :append unless private
    broadcast_action_later_to [user, 'rooms'], action: :append, target: 'public_rooms'
  end

  def replace_later
    broadcast_replace_later_to 'public_rooms' unless private
    broadcast_replace_later_to [user, 'rooms'], target: 'public_rooms'
  end

  def remove_later
    broadcast_remove_to 'public_rooms' unless private
    broadcast_remove_to [user, 'rooms'], target: 'public_rooms'
  end

  def public_rooms
    'public_rooms'
  end

  def broadcasts_target
    private ? [user, 'rooms'] : 'public_rooms'
  end

end
