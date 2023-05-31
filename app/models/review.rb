class Review < ApplicationRecord
  belongs_to :movie

  validates :name, presence: true
  validates :comment, length: { minimum: 4 }
  
  STARS = [1, 2, 3, 4, 5]

  validates :stars, inclusion: { 
    in: STARS, 
    message: "Ratings must be between 1 star and 5 stars" 
  }

  def stars_as_percent
    (stars / 5.0 ) * 100.0
  end
end
