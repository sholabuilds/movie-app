class ReviewsController < ApplicationController
    before_action :set_movie

    def index
        @reviews = @movie.reviews.order(created_at: :desc)
    end

    def new
        @review = @movie.reviews.new
    end

    def create
        @review = @movie.reviews.new(reviews_params)
        if @review.save
            redirect_to movie_reviews_path(@movie), notice: "You've successfully added a review!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @movie.reviews.destroy_all

        redirect_to movie_path, alert: "Reviews successfully deleted!"
    end

    private

    def reviews_params
        params.require(:review).permit(:name, :comment, :stars);
    end

    def set_movie
        # grabs the associated movie
        @movie = Movie.find(params[:movie_id])
    end
end
