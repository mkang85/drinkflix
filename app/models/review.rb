class Review < ApplicationRecord
  belongs_to :user
  belongs_to :film

  validates :content, presence: true
  validates :user_id, presence: true
  validates :film_id, presence: true
end
