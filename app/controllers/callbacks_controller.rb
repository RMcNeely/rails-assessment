class CallbacksController < Devise::OmniauthCallbacksController
    def github
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end

  def failure
    session[:error] = params[:error]
    session[:flash]=  "Some sort of authenticaion failure"
    redirect_to root_path
  end
end
