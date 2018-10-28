class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    validates :username, presence: true, uniqueness: true

    serialize :friends, Array
    serialize :pending_friend_requests, Array
    serialize :pending_friend_invitations, Array

    serialize :challenges, Array
    serialize :pending_challenge_requests, Array
    serialize :pending_challenge_invitations, Array

    has_many :posts

    mount_uploader :avatar, AvatarUploader

    def self.search(search)
        where('name LIKE ? OR username LIKE ? OR email LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    end
end
