class UserAnswersController < ApplicationController
  def create
    new_answer = UserAnswer.new(user: current_user, answer: params[:user_answer][:answer])
    new_answer.save
  end

  private

  def user_answers_params
    params.require(:user_answers).permit(:answer_id)
  end
end
