class UserAnswersController < ApplicationController
  def create
    new_answer = UserAnswer.new(user: current_user, answer: params[])
    raise
    new_answer.save
  end
end
