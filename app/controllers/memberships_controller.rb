class MembershipsController < ApplicationController
  wrap_parameters format: []
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def create
    membership = Membership.create!(membership_params)
    render json: membership, status: :created
  end


  private

  def membership_params
    params.permit(:gym_id, :client_id, :charge)
  end

  def render_not_found_response
    render json: {error: "Membership Not Found"}, status: :not_found
  end

  def render_unprocessable_entity_response
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end

end
