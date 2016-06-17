class SessionsController < ApplicationController

  mapping = Devise.mappings[:user]

  def new
    binding.pry

    session[:user_id] = current_user.id
  end

  def create
    binding.pry
    user = User.find_or_create_by(:uid => auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
    end
    session[:user_id] = user.id
    session[:user_id].blank? ? redirect_to(new_user_session_path) : redirect_to(root_path)
  end

  def auth
    request.env['omniauth.auth']
  end
  #def create
  #  session[:user] = params[:user]
  #   binding.pry
  #end

  def destroy
    session.clear
    redirect_to root_path
  end
end
