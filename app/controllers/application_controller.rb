class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
#  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?


  def index
    binding.pry
    if current_user
      session[:user_id] = current_user.id
    end
    render template: 'layouts/index'
  end

  helpers do
   def logged_in?
     !!session[:id]
   end

   def current_user
     User.find_by_id(session[:id])
   end
 end

rescue_from CanCan::AccessDenied do |exception|
  redirect_to root_url, :alert => exception.message
end


 protected

 def configure_permitted_parameters
       # Fields for sign up
       devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
       # Fields for editing an existing account
       devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
   end

end
