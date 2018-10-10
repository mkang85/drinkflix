class Film < ApplicationRecord
  has_many :ratings
  has_many :reviews
  has_many :drinks
  has_many :users, through: :drinks
end
