module Api
  module V1
    class SessionsController < DeviseTokenAuth::SessionsController
      protected

      def render_create_success
        data = resource_data(resource_json: @resource.token_validation_response)
        data['sign_in_count'] = current_user.sign_in_count
        data['roles'] = current_user.roles.pluck(:name)
        data.delete('allow_password_change')
        render json: {
          data: data
        }
      end
    end
  end
end
