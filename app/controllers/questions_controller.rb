class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @user = current_user
    @user_answer = UserAnswer.new
  end
end
