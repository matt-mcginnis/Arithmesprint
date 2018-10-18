class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  serialize :friends, Array
  serialize :pending_friend_requests, Array
  serialize :pending_friend_invitations, Array
  
  mount_uploader :avatar, AvatarUploader
end
