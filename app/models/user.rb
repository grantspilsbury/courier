class User < ActiveRecord::Base

  attr_accessible :contact_number, :name, 
  :email, :company, :password, :password_confirmation,
  :obfuscated_id

  has_secure_password

  has_one :subscription, dependent: :destroy
  has_many :deliveries

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  after_save :generate_obfuscated_id
  # after_save :subscribe_to_chargify

  validates :password, length: { minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, on: :create

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!(validate: false)
  UserMailer.password_reset(self).deliver
end

def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end

protected

  #   def save_address
  #   @user = current_user
  #         @user.recent_addresses.shift if @user.recent_addresses.size >= 10
  #           @user.recent_addresses.push(params[:delivery][:from_address])
  #       @user.recent_addresses.shift if @user.recent_addresses.size >= 10
  #           @user.recent_addresses.push(params[:delivery][:to_address])
  #       @user.save!
  # end

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

    def generate_obfuscated_id
    update_attribute(:obfuscated_id, Digest::MD5.hexdigest(id.to_s)) if obfuscated_id.blank?
  end
end
