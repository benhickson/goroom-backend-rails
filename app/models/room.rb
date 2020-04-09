class Room < ApplicationRecord
  belongs_to :creator, :class_name => 'User'

  validates_uniqueness_of :name,
    case_sensitive: false,
    conditions: -> { where(closed_at: nil) },
    message: '- That name isn\'t available.'

  def self.open
    self.where('closed_at IS NULL')
  end
end
