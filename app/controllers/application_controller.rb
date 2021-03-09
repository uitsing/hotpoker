class ApplicationController < ActionController::Base
  def set_user
    @user = User.find_by(uuid: session['uuid'])
    redirect_to new_user_path(original_path: request.path) unless @user
  end
end
