class ReviewsController < ApplicationController
  before_action :set_movie
  before_action :authenticate_user!
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def create
    @review = @movie.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      flash[:notice] = 'Review was successfully created.'
      redirect_to short_movie_path(@movie.short_url)
    else
      flash.now[:alert] = 'There was a problem creating the review.'
      render 'movies/show'
    end
  end

  def edit; end

  def update
    if @review.update(review_params)
      flash[:notice] = 'Your review was successfully updated.'
      redirect_to short_movie_path(@review.movie.short_url)
    else
      flash.now[:alert] = 'There was a problem updating your review.'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def authorize_user
    unless @review.user == current_user
      flash[:alert] = 'You are not authorized to edit this review.'
      redirect_to short_movie_path(@review.movie.short_url)
    end
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
