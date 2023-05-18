class Movie < ApplicationRecord
    def flop?
        total_gross.blank? || total_gross < 200000000
    end
end
