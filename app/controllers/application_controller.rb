class ApplicationController < ActionController::Base
  def set_user
    @user = User.find_by(uuid: session['uuid'])
    redirect_to new_user_path unless @user
  end
end
