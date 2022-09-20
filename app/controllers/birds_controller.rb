class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  # okay but not ideal
  # def create
  #   bird = Bird.create(name: params[:name], species: params[:species])
  #   render json: bird, status: :created
  # end

  # BAD BAD BAD
  # def create
  #   bird = Bird.create(params)
  #   render json: bird, status: :created
  # end

  # STRONK PARAMS GOOD
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  def bird_params
    params.permit(:name, :species)
  end

end
