module Api
  module V1
    class SessionsController < DeviseTokenAuth::SessionsController
      protected

      def render_create_success
        data = resource_data(resource_json: @resource.token_validation_response)
        data['roles'] = current_user.roles.pluck(:name)
        render json: {
          data: data
        }
      end
    end
  end
end
