class User < ApplicationRecord
  has_many :ratings
  has_many :reviews
  has_many :drinks
  has_many :films, through: :drinks

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password_digest, presence: true

  has_secure_password
end
