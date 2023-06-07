class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true

  validates :email, format: { with: /\S+@\S+/ },
    uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 10, allow_blank: true }

  validates :username, presence: true, 
    uniqueness: { case_sensitive: false },
    format: { with: /[a-z0-9]/i }

  # access user gravatar profile image
  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end
end
