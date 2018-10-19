class HeadquartersController < ApplicationController
  before_action :authenticate_user!

  def main
  end

  def all_users
    @all_users = User.search(params[:search])
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

      redirect_to root_path
  end

  def friend_accept
      @inviter = User.find(params[:id])

      current_user.pending_friend_requests.delete(@inviter.id)
      current_user.friends.push(@inviter.id)

      @inviter.pending_friend_invitations.delete(current_user.id)
      @inviter.friends.push(current_user.id)

      @inviter.save
      current_user.save

      redirect_to root_path
  end

  def friend_decline
      @inviter = User.find(params[:id])

      current_user.pending_friend_requests.delete(@inviter.id)

      @inviter.pending_friend_invitations.delete(current_user.id)

      @inviter.save
      current_user.save

      redirect_to root_path
  end

  def unfriend
      @unfriended = User.find(params[:id])

      current_user.friends.delete(@unfriended.id)
      @unfriended.friends.delete(current_user.id)

      @unfriended.save
      current_user.save

      redirect_to root_path
  end
end
