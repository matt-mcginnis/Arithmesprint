class ChallengeController < ApplicationController
    require 'problem'

    # Create a Challenge
    def create
        category = params[:category]
        length = params[:length].to_i
        issuer_id = params[:issuer_id]
        receiver_id = params[:receiver_id]
        problems_from_category = Problem.where(problem_type: category)
        problem_array = problems_from_category.sample(length)

        challenge = Challenge.create(category: category, length: length, issuer_id: issuer_id, receiver_id: receiver_id, issuer_score: 0, receiver_score: 0, accepted: false, problem_array: problem_array)

        issuer = User.find(issuer_id)
        issuer.pending_challenge_invitations.push(challenge.id)
        receiver = User.find(receiver_id)
        receiver.pending_challenge_requests.push(challenge.id)

        issuer.save
        receiver.save

        redirect_to challenge_run_path(id: challenge.id)
    end

    # Run a Challenge After it is Created
    def run
        @challenge = Challenge.find(params[:id])
    end

    # Evaluate the Outcome of a Challenge
    def outcome
        @challenge = Challenge.find(params[:id])

        score = 0

        @challenge.problem_array.each_with_index do |problem, index|
            if problem.answer == params["user_answer_#{index}".to_sym]
                score += 1
            end
        end

        if current_user.id == @challenge.issuer_id
            @challenge.update(issuer_score: score)
            @challenge.save
        else
            @challenge.update(receiver_score: score)
            @challenge.save

            issuer = User.find(@challenge.issuer_id)
            receiver = User.find(@challenge.receiver_id)

            issuer_wins = User.find(@challenge.issuer_id).challenge_wins
            issuer_losses = User.find(@challenge.issuer_id).challenge_losses
            issuer_ties = User.find(@challenge.issuer_id).challenge_ties

            receiver_wins = User.find(@challenge.receiver_id).challenge_wins
            receiver_losses = User.find(@challenge.receiver_id).challenge_losses
            receiver_ties = User.find(@challenge.receiver_id).challenge_ties

            if @challenge.issuer_score > @challenge.receiver_score
                issuer.update(challenge_wins: issuer_wins + 1)
                receiver.update(challenge_losses: receiver_losses + 1)
                issuer.save
                receiver.save
            elsif @challenge.issuer_score < @challenge.receiver_score
                issuer.update(challenge_losses: issuer_losses + 1)
                receiver.update(challenge_wins: receiver_wins + 1)
                issuer.save
                receiver.save
            else
                issuer.update(challenge_ties: issuer_ties + 1)
                receiver.update(challenge_ties: receiver_ties + 1)
                issuer.save
                receiver.save
            end
        end

        @challenge.save
    end

    # Invite a Player to a Challenge
    def invite
        # This is a wrapper method that calls on a challenge
        # to be created
        receiver_id = params[:receiver_id]
        @receiver = User.find(receiver_id)
    end

    # Accept a Challenge Invitation From Another Player
    def accept
      challenge = Challenge.find(params[:id])
      issuer = User.find(challenge.issuer_id)

      challenge.update(accepted: true)

      current_user.pending_challenge_requests.delete(challenge.id)

      issuer.pending_challenge_invitations.delete(challenge.id)

      issuer.save
      current_user.save

      redirect_to challenge_run_path(id: challenge.id)
    end

    # Decline a Challenge Invitation From Another Player
    def decline
      challenge = Challenge.find(params[:id])
      issuer = User.find(challenge.issuer_id)

      current_user.pending_challenge_requests.delete(challenge.id)

      issuer.pending_challenge_invitations.delete(challenge.id)

      issuer.save
      current_user.save

      redirect_to root_path
    end
end
