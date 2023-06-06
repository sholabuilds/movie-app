module ReviewsHelper
    def average_reviews_helper(movie)
        if movie.average_stars.zero?
            content_tag(:strong, "No reviews")
        else
            pluralize(movie.average_stars, "star")
        end
    end

end
