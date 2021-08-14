class GymsController < ApplicationController
  wrap_parameters format: []
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def index
    gyms = Gym.all
    render json: gyms
  end

  def show
    gym = Gym.find(params[:id])
    render json: gym, status: :ok
  end

  def update
    gym = Gym.find(params[:id])
    gym.update!(gym_params)
    render json: gym
  end

  def destroy
    gym = Gym.find(params[:id])
    gym.destroy
    head :no_content
  end

  private

  def gym_params
    params.permit(:name, :address)
  end

  def render_not_found_response
    render json: {error: "Gym Not Found"}, status: :not_found
  end

  def render_unprocessable_entity_response
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end

end
