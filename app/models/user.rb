class User < ApplicationRecord
  # has_many :messages
  # has_many :chatrooms, through: messages
  has_one :profile

  # validates :username, presence: true, uniqueness: true

  has_secure_password
end
