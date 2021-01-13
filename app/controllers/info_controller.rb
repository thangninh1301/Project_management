class InfoController < ApplicationController
  before_action :authenticate_user!
end
