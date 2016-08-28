module ApplicationHelper
  include ActionView::Helpers::NumberHelper

  def set_session_user user
    session[:user_id] = user.id
    session[:username] = user.username

    user = User.find(session[:user_id])
    session[:full_name] = user.get_fullname
    session[:birthdate] = user.get_profile('birthdate')
    session[:birthdate] = session[:birthdate].to_time.strftime('%B %d, %Y') unless session[:birthdate].nil?
    session[:address] = user.get_profile('address')
    session[:contactno] = user.get_profile('contactno')
  end

  def clear_session(array_session_field)
    array_session_field.each do |field|
      session[field] = nil
    end
  end

  def count_field_not_nil(obj_name, array_field)
    total = 0
    array_field.each do |field|
      total += 1 unless obj_name[field.to_sym].nil? or obj_name[field.to_sym] == ''
    end

    return {
      :count => total,
      :percent => number_with_precision((Float(total)/obj_name.count)*100, precision: 0)
    }
  end

  def retrieve_field lists, field
    profile_field = '' and return if lists.nil?
    profile_field = lists[field].to_s
    profile_field
  end

  # This returns current_user object
  # based on the session user_id
  def current_user
    user = User.find(session[:user_id])

    # create user account
    user_account = {
      :id => user[:id],
      :username => user[:username],
      :full_name => user.get_fullname,
      :birthdate => user.get_profile('birthdate'),
      :address => user.get_profile('address'),
      :contactno => user.get_profile('contactno')
    }

    user_account
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
