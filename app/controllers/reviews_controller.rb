require 'pry'
class ReviewsController < ApplicationController
  def index
    @film = Film.find(params[:film_id])
    @reviews = Review.where(film_id: params[:film_id])
    @reviews = @film.reviews
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
      render :new
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
          redirect_to films_path
        else
          @review = @film.reviews.find_by(id: params[:id])
          redirect_to film_reviews_path(@film), if @review.nil?
        end
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

def destroy
  @review = Review.find(params[:id])
  @review.destroy
  redirect_to film_reviews_path
end


  private
   def review_params
     params.require(:review).permit(:title, :content, :film_id, :user_id, {:drink_attributes => [:name, :amount]})
   end

end
