module Api
  module V1
    class UsersController < ApplicationController
      load_and_authorize_resource

      def index
        users = @users.paginate(page: request.headers['page'])
        render json: { success: true,
                       data: { items: users,
                               meta: users.total_pages } }
      end

      def show
        render json: { success: true,
                       data: { item: @user } }
      end

      def create
        if @user.save
          @user.send_confirmation_instructions
          render json: { success: true,
                         message: "an email had send to #{@user.email}" }
        else
          render json: { errors: @user.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        @user.destroy
        render json: { success: true,
                       data: { item: @user } }, status: :ok
      end

      def update
        if @user.update_attributes(user_params)
          message = 'Profile updated'
          message = "Profile updated, an email had send to #{user_params[:email]}" if user_params[:email] != @user.email
          render json: { success: true,
                         message: message,
                         data: { item: @user } }
        else
          render json: { success: false,
                         errors: @user.errors.message,
                         data: { item: @user } }
        end
      end

      private

      def user_params
        params.permit(:code, :email, :password, :join_date, :contract_type, :position)
      end
    end
  end
end
