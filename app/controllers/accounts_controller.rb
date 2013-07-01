class AccountsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @accounts = current_user.accounts
  end
end
