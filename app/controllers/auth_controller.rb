class AuthController < ApplicationController
  include AuthHelper

  def login
    redirect_to root_path and return unless session[:user_id].nil?
    render layout: 'account'
  end

  def create
    authenticate params
  end

  def logout
    session[:user_id]= nil
    session[:username]= nil
    session[:full_name]= nil

    redirect_to root_path, flash: { success: 'Successfully logout!' }
  end

  private

  def account_params
    params.permit(:username, :password)
  end
end
