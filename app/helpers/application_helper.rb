module ApplicationHelper
  def set_session_user user
    session[:user_id] = user.id
    session[:username] = user.username

    profile = Profile.find_by user_id: user.id
    if profile.present?
      session[:full_name] = %Q(#{profile[:firstname]} #{profile[:lastname]})
    end
    # Todo: add user profiles
  end

  def retrieve_field lists, field
    profile_field = '' and return if lists.nil?
    profile_field = lists[field].to_s
    profile_field
  end

  def current_user
    user = User.find(session[:user_id])

    # get user profile
    profile = user.profile

    session[:birthdate] = profile[:birthdate]
    puts session.to_json
    # if profile.present?
    #   session[:full_name] = %Q(#{profile[:firstname]} #{profile[:lastname]})
    #   session[:birthdate] = %Q(#{profile[:birthdate]})
    # end

    user
  end
end
