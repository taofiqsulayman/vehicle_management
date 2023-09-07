class Api::V1::UsersController < ApplicationController
  before_action :find_vehicle, only: [:show, :update, :set_acceptable_pattern]

  # show users
  def index
    users = User.all
    render json: users
  end

  # check if the user role
  def check_role
    email = params[:email]

    if email.present?
      user = User.find_by(email: email)

      if user.present?
        render json: { role: user.role }
      else
        render json: { error: 'User not found' }, status: :not_found
      end
    else
      render json: { error: 'Email parameter is missing' }, status: :bad_request
    end
  end

  # update the state of a vehicle
  def update
    if current_user.present?
      if current_user.admin?
        if user_is_admin?
          pattern = params[:pattern].split('->').map(&:strip)
          @vehicle.set_acceptable_pattern(pattern)

          render json: { message: 'Acceptable pattern set successfully' }
        else
          render json: { error: 'Unauthorized admin action' }, status: :unauthorized
        end
      elsif current_user.regular?
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
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  private

  def find_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def user_can_modify?
    valid_transition? && within_acceptable_pattern?
  end

  def valid_transition?
    @vehicle.aasm.events.map(&:name).include?("to_#{new_state}")
  end

  def within_acceptable_pattern?
    return true if @vehicle.acceptable_pattern.blank?

    @vehicle.acceptable_pattern.each_cons(2) do |from_state, to_state|
      return true if from_state == @vehicle.state && to_state == new_state
    end

    false
  end

  def new_state
    params[:new_state]
  end

  def user_is_admin?
    current_user.present? && current_user.admin?
  end
end
