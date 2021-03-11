class UsersController < ApplicationController
  before_action :set_user, except: %i[new create]

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user
      session['uuid'] = user.uuid
      redirect_to original_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def show; end

  private

  def original_path
    params.require(:user).permit(:original_path)[:original_path]
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
