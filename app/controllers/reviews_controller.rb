require 'pry'
class ReviewsController < ApplicationController
  def index
    #do I want the reviews index to control what I'm seeing under the films?
    #I think with both films and users pointing to this index, I would need to
    #create a conditional, if there is a params[:film_id], then we should render
    #all the reviews associated with a film.
    #however, if we are greeted with a params[:user_id], then we should render
    # all the reviews associated with a user.
    # if params[:film_id]
    # @reviews = Review.where(:film_id, params[:film_id])
    # else
    #   @reviews = Review.where(:user_id, params[:user_id])
    # end
    @film = Film.find(params[:film_id])
    @reviews = Review.where(film_id: params[:film_id])
  end

  def new
    @film = Film.find(params[:film_id])
    @review = Review.new(film_id: params[:film_id], user_id: User.find(session[:user_id]).id)
  end

  def create
    binding.pry
    @review = Review.create(review_params)
    if @review.save
    redirect_to film_reviews_path(@review)
    else
      redirect_to new_film_review_path
    end
  end

  def show
    binding.pry
    @review = Review.find(params[:id])
  end


  private
   def review_params
     params.require(:review).permit(:content, :film_id, :user_id)
   end
end
