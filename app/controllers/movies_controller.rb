class MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end

    def show
        @movie = Movie.find(params[:id]);
    end

    def edit
        @movie = Movie.find(params[:id]);
    end

    def update
        @movie = Movie.find(params[:id]);
        # specifies attributes we want to permit for update
        event_param = params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross);
        @movie.update(event_param)
        # redirect to show view
        redirect_to movie_path(@movie)
    end
end
