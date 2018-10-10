class Drink < ApplicationRecord
  belongs_to :user
  belongs_to :film
end
