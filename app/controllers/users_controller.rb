class UsersController < ApplicationController

  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    if params[:id] == "sign_out"
      sign_out current_user
      return
    end
    @user = User.find_by(id: params[:id])
  end


  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(users_params)
    redirect_to user_path
  end

  def users_params
    params.require(:user).permit(:bio, :status, :completed_assessments => [])
  end

  def current_ability
    @current_ability ||= Ability.new(current_user, session)
end


end
