class Movie < ApplicationRecord
    validates :title, :released_on, :duration, presence: true
    validates :description, length: { minimum: 25 }
    validates :total_gross, numericality: { greater_than_or_equal_to: 0 }
    validates :image_file_name, format: {
        with: /\w+\.(jpg|png)\z/i,
        message: "must be a JPG or PNG image"
    }

    RATINGS = %w(G PG PG-13 PG-15 R NC-17)
    validates :rating, inclusion: { in: RATINGS,
        message: "%{value} is not a valid rating"
    }
    

    def self.prev_released
        where("released_on < ?", Time.now).order("released_on desc")
    end
    
    def flop?
        total_gross.blank? || total_gross < 200000000
    end
end
