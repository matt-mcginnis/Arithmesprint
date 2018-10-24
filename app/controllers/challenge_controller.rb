class ChallengeController < ApplicationController
  def new
  end

  def create
    category = params[:category]
    length = params[:length].to_i
    issuer_id = params[:issuer_id].to_i
    receiver_id = params[:receiver_id].to_i
    @problems_from_category = Problem.where(problem_type: category)
    problem_array = @problems_from_category.sample(length)

    challenge = Challenge.create(category: category, length: length, issuer_id: issuer_id, receiver_id: receiver_id, problem_array: problem_array)

    redirect_to challenge_run_path(id: challenge.id)
  end

  def run
      @challenge = Challenge.find(params[:id])

      @score = 0;

      @challenge.problem_array.each_with_index do |problem, index|
        if problem.answer == params[("user_answer_#{index}").to_sym]
            @score += 1
        end
      end
  end

  def issuer_outcome
      @challenge = Challenge.find(params[:id])

      @score = 0;

      @challenge.problem_array.each_with_index do |problem, index|
        if problem.answer == params[("user_answer_#{index}").to_sym]
            @score += 1
        end
      end
  end

  def receiver_outcome
      @challenge = Challenge.find(params[:id])

      @score = 0;

      @challenge.problem_array.each_with_index do |problem, index|
        if problem.answer == params[("user_answer_#{index}").to_sym]
            @score += 1
        end
      end
  end

  def invite
  end

  def accept
  end

  def decline
  end
end
