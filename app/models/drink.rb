class Drink < ApplicationRecord
  has_many :reviews
  has_many :films, through: :reviews


  def self.boozy
    where("amount >= 5")
  end

  def self.tipsy
    where("amount <= 4")
  end

end
