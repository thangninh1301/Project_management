module Api
  module V1
    class ApplicationController < ActionController::API
      include DeviseTokenAuth::Concerns::SetUserByToken
      before_action :authenticate_user!
      before_action :configure_permitted_parameters, if: :devise_controller?

      protected

      rescue_from CanCan::AccessDenied do |exception|
      end

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password])
      end
    end
  end
end
