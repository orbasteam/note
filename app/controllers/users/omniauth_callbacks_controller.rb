class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2

    omniauth = request.env["omniauth.auth"]
    @user = User.find_by(email: omniauth[:info][:email])

    unless @user

      @user = User.new(
        password: Devise.friendly_token[0,20],
        email: omniauth[:info][:email]
      )
      @user.skip_confirmation!
      unless @user.save
        return redirect_to unauthenticated_root_path, notice: @user.errors
      end

    end

    # flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
    sign_in_and_redirect @user, :event => :authentication
  end

end