module Api
  module V1
    class ApplicationController < ActionController::API
      include DeviseTokenAuth::Concerns::SetUserByToken
      before_action :authenticate_user!
      before_action :configure_permitted_parameters, if: :devise_controller?

      rescue_from CanCan::AccessDenied do |exception|
        render json: { message: exception.message,
                       your_roles: current_user.roles.pluck(:name) }, status: 403
      end

      protected

    end
  end
end
