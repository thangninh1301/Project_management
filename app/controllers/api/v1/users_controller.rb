class Api::V1::UsersController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def index
    @users = User.where.not(confirmed_at: nil).paginate(page: params[:page])
  end
end
