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
    # if profile.present?
    #   session[:full_name] = %Q(#{profile[:firstname]} #{profile[:lastname]})
    #   session[:birthdate] = %Q(#{profile[:birthdate]})
    # end

    user
  end

  # This returns 'activate' string
  # if the passed in data matches the
  # current request path.
  #
  # @param path - A string or an array of possible matches
  #               for example: 'home' or ['questions', 'community']
  def should_activate(path)
    return 'active' if path=='/' && request.path=='/'
    if path.is_a? Array
      matcher = '(' + path.join('|') + ')'
      pattern = Regexp.new(matcher, Regexp::IGNORECASE)
    else
      pattern = /^\/#{path}/i
    end

    return 'active' if request.path.match(pattern)
  end
end
