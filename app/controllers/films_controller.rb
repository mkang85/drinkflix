require 'pry'
class FilmsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index]

  def index
    @films = Film.all
  end

  def new
    @film = Film.new
  end

  def create
    @film = Film.create(film_params)
    if @film.save
      redirect_to film_path(@film)
    else
      render 'new'
    end
  end

  def show
    @film = Film.find(params[:id])
  end

  def edit
  @film = Film.find(params[:id])
  end

def update
  @film = Film.find(params[:id])
  @film.update(film_params)
  redirect_to film_path(@film)
end

def destroy
  @film = Film.find(params[:id])
  @film.destroy
  redirect_to films_path
end

  private
  def film_params
    params.require(:film).permit(:title)
  end




  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
