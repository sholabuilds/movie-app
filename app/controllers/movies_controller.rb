class MoviesController < ApplicationController
    def index
        @movies = ["Insecure", "Gangs of Lagos", "Kings of Jo'Burg"]
    end
end
