module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    before_action :find_or_register

    def facebook; end

    private

    def find_or_register
      @user = User.from_omniauth(request.env["omniauth.auth"])

      return redirect_to root_path unless @user.persisted?

      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: @user.provider) if is_navigational_format?
    end
  end
end