module Api
  module V1
    class UsersController < ApplicationController
      load_and_authorize_resource
      def show; end

      def index
        render json: { users: @users }, status: 200
      end
    end
  end
end
