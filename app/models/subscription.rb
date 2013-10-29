class Subscription < ActiveRecord::Base
  attr_accessible :chargify_subscription_id, :user_id, :status

  validates :chargify_subscription_id, presence: true
  validates :user_id, presence: true

  belongs_to :user

  def active?
    status == 'active'
  end

  def canceled?
    status == 'canceled'
  end
end