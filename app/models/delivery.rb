class Delivery < ActiveRecord::Base
  belongs_to :user
  attr_accessible :from_address, :from_area, :quote, :special_instructions, :to_address, :to_area
end
