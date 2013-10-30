class Delivery < ActiveRecord::Base
  belongs_to :user
  attr_accessible :from_address, :special_instructions,
  :to_address, :size, :fee

  validates :from_address, presence: true
  validates :to_address, presence: true
  validates :size, presence: true

end
