class Review < ApplicationRecord
  belongs_to :user
  belongs_to :film

  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { less_than_or_equal_to: 10 }
  validates :rating, numericality: { only_integer: true }
  validates :user_id, presence: true
  validates :film_id, presence: true
end
