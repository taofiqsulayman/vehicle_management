class Api::V1::VehiclesController < ApplicationController
  # GET /api/v1/vehicles
  def index
    vehicles = Vehicle.all
    render json: vehicles
  end

  # PATCH /api/v1/vehicles/:id/update_state
  def update_state
    @vehicle = Vehicle.find(params[:id])

    if user_can_modify?
      if @vehicle.send("to_#{new_state}")
        render json: @vehicle
      else
        render json: { error: 'Invalid state transition' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  # POST /api/v1/vehicles/:id/set_acceptable_pattern
  def set_acceptable_pattern
    @vehicle = Vehicle.find(params[:id])

    if user_is_admin?
      pattern = params[:pattern].split('->').map(&:strip)
      @vehicle.set_acceptable_pattern(pattern)

      render json: { message: 'Acceptable pattern set successfully' }
    else
      render json: { error: 'Unauthorized admin action' }, status: :unauthorized
    end
  end

  private


  def user_can_modify?
    current_user.present? && valid_transition?
  end

  def valid_transition?
    @vehicle.aasm.events.map(&:name).include?("to_#{new_state}")
  end

  def new_state
    params[:new_state]
  end

  def user_is_admin?
    current_user.present? && current_user.admin?
  end
end
