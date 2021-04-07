class Users::UsersController < ApplicationController

  layout "private_layout"

  before_action :authenticate_user!

  def index
    @articles = Article.all
  end

  private

    def user_params
      params.require(:user).permit(:usermame, :avatar)
    end

end
