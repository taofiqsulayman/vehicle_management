# class Api::V1::AdminController < ApplicationController
#   before_action :find_vehicle, only: [:set_acceptable_pattern]

#   def set_acceptable_pattern
#     if user_is_admin?
#       pattern = params[:pattern].split('->').map(&:strip)
#       @vehicle.set_acceptable_pattern(pattern)

#       render json: { message: 'Acceptable pattern set successfully' }
#     else
#       render json: { error: 'Unauthorized' }, status: :unauthorized
#     end
#   end

#   private

#   def find_vehicle
#     @vehicle = Vehicle.find(params[:vehicle_id])
#   end

#   def user_is_admin?
#     current_user.present? && current_user.admin?
#   end
# end
