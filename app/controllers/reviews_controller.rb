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

    @film = Film.find(params[:film_id])
    @review = Review.create(review_params)

    if @review.save
    redirect_to film_review_path(@film, @review)
    else
      redirect_to new_film_review_path
    end
  end

  def show
    @film = Film.find(params[:film_id])
    @review = Review.find(params[:id])
  end

  def edit
    if params[:film_id]
        @film = Film.find_by(id: params[:film_id])
        if @film.nil?
          redirect_to films_path, alert: "Film not found."
        else
          @review = @film.reviews.find_by(id: params[:id])
          redirect_to film_reviews_path(@film), alert: "Review not found." if @review.nil?
        end
      else
        @review = Review.find(params[:id])
      end
  end

def update
  @review = Review.find(params[:id])
  if @review.update(review_params)
    redirect_to film_review_path
  else
    render 'edit'
  end
end

  private
   def review_params
     params.require(:review).permit(:title, :content, :film_id, :user_id, {:drink_attributes => [:name, :amount]})
   end

end
