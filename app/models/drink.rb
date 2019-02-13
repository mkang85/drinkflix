class Drink < ApplicationRecord
  has_many :reviews
  has_many :films, through: :reviews
end
