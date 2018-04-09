class Api::V1::UsersController < ApiController
  before_action :authenticate_user!

  def index
    @user = User.all
    render json: @user
  end
end
