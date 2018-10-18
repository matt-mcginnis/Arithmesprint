class HeadquartersController < ApplicationController
  before_action :authenticate_user!

  def main
  end

  def all_users
    @all_users = User.all
  end

  def show_user
    @user = User.find(params[:id])
  end

  def friend_invite
      @invited = User.find(params[:id])

      current_user.pending_friend_invitations.push(@invited.id)
      @invited.pending_friend_requests.push(current_user.id)

      @invited.save
      current_user.save
  end

  def friend_accept
      @inviter = User.find(params[:id])

      current_user.pending_friend_requests.delete(@inviter.id)
      current_user.friends.push(@inviter.id)

      @inviter.pending_friend_invitations.delete(current_user.id)
      @inviter.friends.push(current_user.id)

      @inviter.save
      current_user.save
  end

  def unfriend
  end
end
