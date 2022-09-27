class BirdsController < ApplicationController
wrap_parameters found: []
  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
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

  def create
    #find
    bird = Bird.find_by(id:params[:id])
    #update
    if bird
      bird.update(bird_params)
      render json: bird,status: :accepted
    else
      render json: {error:"production not found"},status: :not_found
    end
  end

  def increment_likes
    bird = Bird.find_by(id:params[:id])
    if bird
      bird.update(bird_params)
      render json: bird
    else
      render json: {error: "Bird not found"},status: :not_found
    end
  end

  private

  def bird_params
    params.permit(:name, :species,:likes)
  end

end
