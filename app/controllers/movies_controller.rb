class MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = current_user.movies.build(movie_params)

    if @movie.save
      flash[:notice] = 'Product was successfully created.'
      redirect_to @movie
    else
      flash.now[:alert] = 'There was a problem creating the movie.'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :blurb, :date_released, :country_of_origin, :showing_start, :showing_end)
  end
end