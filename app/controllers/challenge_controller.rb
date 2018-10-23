class ChallengeController < ApplicationController
  def new
  end

  def create
    challenge = Challenge.create(category: params[:category], length: params[:length], issuer_id: params[:issuer_id], receiver_id: params[:receiver_id])
  end

  def run
  end

  def invite
  end

  def accept
  end

  def decline
  end
end
