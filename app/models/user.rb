class User < ApplicationRecord
  has_secure_password
  before_create :create_token

  def create_token
    self.token = SecureRandom.base64(15)
  end
end
