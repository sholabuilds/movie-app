class Movie < ApplicationRecord
    def flop?
        total_gross.blank? || total_gross < 10000
    end
end
