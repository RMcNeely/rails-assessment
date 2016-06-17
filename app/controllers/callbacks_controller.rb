class CallbacksController < Devise::OmniauthCallbacksController
    def github
      binding.pry
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end

  #  def passthru
  #    :provider = github
  #  end
end
