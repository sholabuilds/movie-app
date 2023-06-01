class MoviesController < ApplicationController

    def index
        @movies = Movie.all
    end

    def show
        @movie = Movie.find(params[:id]);
        @review = @movie.reviews.new
    end

    def edit
        @movie = Movie.find(params[:id]);
    end

    def update
        @movie = Movie.find(params[:id]);
        if @movie.update(event_param)
            # redirect to show view and displays message for user
            redirect_to movie_path(@movie), notice: "Movie successfully updated!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def new
        @movie = Movie.new
    end

    def create
        @movie = Movie.new(event_param)
        if @movie.save
            redirect_to movie_path(@movie), notice: "Movie successfully created!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        Movie.find(params[:id]).destroy
        redirect_to movies_path, alert: "Movie successfully deleted!"
    end

    private

    # specifies attributes we want to permit for update
    def event_param
        params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :director, :image_file_name, :duration);
    end
end
