class Room < ApplicationRecord
  belongs_to :creator, :class_name => 'User'

  def self.open
    self.where('closed_at IS NULL')
  end
end
