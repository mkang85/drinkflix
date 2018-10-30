class User < ApplicationRecord
  has_many :reviews
  has_many :films, through: :reviews
  has_many :drinks, through: :films

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password_digest, presence: true

  has_secure_password


end
