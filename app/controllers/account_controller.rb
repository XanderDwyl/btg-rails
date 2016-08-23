class AccountController < ApplicationController
  include AuthHelper

  def index; end

  def new
    # notice_msg = "Can't create user when login"
    # redirect_to account_index_path, :notice => notice_msg and return if isLogin
    # render layout: 'account'
  end

  def create
    user = User.new(account_params)
    if user.save
      set_session_user user
      notice_msg = "Welcome #{user[:username]}"
      redirect_to account_index_path, flash: { success: 'Successfully logout!' }
    end
  rescue ActiveRecord::RecordNotUnique
    notice_msg = "Duplicate entry '#{user[:username]}'"
    redirect_to account_new_path, :notice => notice_msg
  end

  def edit; end


  private
    def account_params
      params.permit(:username, :password)
    end
end
