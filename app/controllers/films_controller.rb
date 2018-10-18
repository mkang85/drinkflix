class FilmsController < ApplicationController
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
  end

  def edit
  end

  def destroy
  end 

  private
  def film_params
    params.require(:film).permit(:title)
  end
end
