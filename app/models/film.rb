class Film < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  has_many :drinks, through: :reviews


  validates :title, presence: true
  validates :title, uniqueness: true



  def self.all_films
    Film.all
  end



end
