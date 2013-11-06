class Delivery < ActiveRecord::Base
  belongs_to :user
  attr_accessible :from_address, :special_instructions,
  :to_address, :fee

  validates :from_address, presence: true
  validates :to_address, presence: true
    validates :special_instructions, presence: true

end
