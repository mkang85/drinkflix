class Review < ApplicationRecord
  belongs_to :user
  belongs_to :film
  belongs_to :drink

accepts_nested_attributes_for :drink

  def drinks_attributes=(drinks_attributes)
    drinks_attributes.values.each do |drink_attribute|
      drink = Drink.find_or_create_by(drink_attribute)
      self.drink << drink
    end
  end

  validates :content, presence: true
  validates :user_id, presence: true
  validates :film_id, presence: true
end
