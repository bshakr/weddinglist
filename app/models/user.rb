class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  def auth_token_expired?
    auth_token_expires_at.to_i < Time.now.to_i
  end

  def generate_auth_token(expires = nil)
    self.auth_token = SecureRandom.hex(20)
    self.auth_token_expires_at = expires || 1.day.from_now
  end

  def regenerate_auth_token!(expires = nil)
    Rails.logger.info "Regenerating user autho token"
    Rails.logger.info "Expiration: #{expires}" if expires
    generate_auth_token(expires)
    save!
  end
end
