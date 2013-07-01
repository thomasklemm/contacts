class OmniauthController < ApplicationController
  def facebook
    auth = request.env['omniauth.auth']
    Account.from_omniauth(current_user, auth)
    redirect_to accounts_path, notice: 'Your Facebook account has been successfully connected.'
  end
end
