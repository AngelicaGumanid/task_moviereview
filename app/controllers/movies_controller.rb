class MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @movies = Movie.order(created_at: :desc).page(params[:page]).per(5)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = current_user.movies.build(movie_params)
    @movie.generate_short_url

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
    @reviews = @movie.reviews.order(rating: :desc)
    @review = Review.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id]) # Find the movie by ID

    if @movie.update(movie_params)
      flash[:notice] = 'Movie was successfully updated.'
      redirect_to @movie
    else
      flash.now[:alert] = 'There was a problem updating the movie.'
      render :edit, status: :unprocessable_entity
    end
  end

  def redirect_short_url
    @movie = Movie.find_by(short_url: params[:short_url])
    if @movie
      redirect_to @movie
    else
      flash[:alert] = 'Movie not found.'
      redirect_to movies_path
    end
  end


  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :blurb, :date_released, :country_of_origin, :showing_start, :showing_end, genre_ids: [])
  end
end
