class Drink < ApplicationRecord
  belongs_to :users
  belongs_to :films
end
