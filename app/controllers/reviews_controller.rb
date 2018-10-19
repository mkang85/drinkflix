class ReviewsController < ApplicationController
  def index
    #do I want the reviews index to control what I'm seeing under the films?
    #I think with both films and users pointing to this index, I would need to
    #create a conditional, if there is a params[:film_id], then we should render
    #all the reviews associated with a film.
    #however, if we are greeted with a params[:user_id], then we should render
    # all the reviews associated with a user.
    if params[:film_id]
    @reviews = Review.where(:film_id, params[:film_id])
    else
      @reviews = Review.where(:user_id, params[:user_id])
    end
  end

  def new
  end
end
