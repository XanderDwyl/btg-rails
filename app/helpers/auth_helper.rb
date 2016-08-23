module AuthHelper
  include ApplicationHelper

  def authenticate(user_params)
    puts user_params.to_json
    user = User.find_by_username(user_params[:username])

    if user && user.authenticate(user_params[:password])
      set_session_user user

      route_url = root_path
      notify_msg = "Welcome back, #{user[:username]}"
      redirect_to account_index_path, flash: { success: notify_msg } and return
    end

    # not yet authenticate
    notify_msg = "Invalid email or password"
    redirect_to login_path, flash: { error: notify_msg }
  end

  def isLogin?
    session[:user_id].present?
  end
end
