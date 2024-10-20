class MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @genres = Genre.all
    @movies = Movie.all

    if params[:genre_id].present?
      @movies = @movies.joins(:genres).where(genres: { id: params[:genre_id] })
    end

    if params[:showing_status].present?
      if params[:showing_status] == 'currently_showing'
        @movies = @movies.where('showing_start <= ? AND showing_end >= ?', Date.today, Date.today)
      elsif params[:showing_status] == 'upcoming'
        @movies = @movies.where('showing_start > ?', Date.today)
      end
    end

    @movies = @movies.order(:title).page(params[:page]).per(5)
    # @movies = Movie.order(created_at: :desc).page(params[:page]).per(5)

  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = current_user.movies.build(movie_params)

    if @movie.save
      flash[:notice] = 'Product was successfully created.'
      redirect_to short_movie_path(@movie.short_url)
    else
      flash.now[:alert] = 'There was a problem creating the movie.'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    if params[:short_url]
      @movie = Movie.find_by(short_url: params[:short_url])
    else
      @movie = Movie.find(params[:id])
    end

    if @movie.nil?
      flash[:alert] = 'Movie not found.'
      redirect_to movies_path
    else
      @reviews = @movie.reviews.order(rating: :desc)
      @review = Review.new
    end
  end


  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id]) # Find the movie by ID

    if @movie.update(movie_params)
      flash[:notice] = 'Movie was successfully updated.'
      redirect_to short_movie_path(@movie.short_url)
    else
      flash.now[:alert] = 'There was a problem updating the movie.'
      render :edit, status: :unprocessable_entity
    end
  end

  def redirect_short_url
    @movie = Movie.find_by(short_url: params[:short_url])
    if @movie
      @reviews = @movie.reviews.order(rating: :desc)
      @review = Review.new
      render :show  # Render the show view
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
