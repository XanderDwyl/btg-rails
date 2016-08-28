class User < ApplicationRecord
  # has_many :messages
  # has_many :chatrooms, through: messages
  # validates :username, presence: true, uniqueness: true
  has_one :profile
  has_secure_password

  def get_fullname
    %Q(#{profile[:firstname]} #{profile[:lastname]}) unless profile.nil?
  end

  def get_profile(field)
    profile[field] unless profile.nil?
  end

end
