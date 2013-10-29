class Delivery < ActiveRecord::Base
  belongs_to :user
  attr_accessible :from_address, :from_area, :quote,
  :special_instructions, :to_address, :to_area

  validates :from_address, presence: true
  validates :from_area, presence: true
  validates :to_address, presence: true
  validates :to_area, presence: true

end
