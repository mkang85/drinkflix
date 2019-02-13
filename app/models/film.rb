class Film < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  has_many :drinks, through: :reviews 

  accepts_nested_attributes_for :drinks

  validates :title, presence: true
  validates :title, uniqueness: true


  def drink_attributes=(drink_attributes)
    drink_attributes.values.each do |drink_attribute|
      drink = Drink.find_or_create_by(drink_attribute)
      self.drinks << drink
    end
  end

  def self.all_films
    Film.all
  end



end
