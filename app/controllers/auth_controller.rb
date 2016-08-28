class AuthController < ApplicationController
  include AuthHelper

  def login
    render layout: 'application'
  end

  def create
    authenticate params
  end

  def logout
    clear_session(['user_id', 'username', 'full_name', 'birthdate', 'address', 'contactno'])
    redirect_to root_path, flash: { success: 'Successfully logout!' }
  end

  private

  def account_params
    params.permit(:username, :password)
  end
end
