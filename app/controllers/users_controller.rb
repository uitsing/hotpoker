class UsersController < ApplicationController
  before_action :set_user, except: %i[new create]

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user
      session['uuid'] = user.uuid
      redirect_to rooms_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
