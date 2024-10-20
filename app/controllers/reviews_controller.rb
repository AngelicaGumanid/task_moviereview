class ReviewsController < ApplicationController
  before_action :set_movie

  def create
    @review = @movie.reviews.build(review_params)
    @review.user = current_user  # Associate the review with the current user

    if @review.save
      flash[:notice] = 'Review was successfully created.'
      redirect_to @movie
    else
      flash.now[:alert] = 'There was a problem creating the review.'
      render 'movies/show'
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
