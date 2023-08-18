class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @lists = List.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movie_path(@movie), notice: 'Movie was successfully created.'
    else
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :ratings)
  end
end
