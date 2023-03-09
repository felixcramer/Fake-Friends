class QuestionsController < ApplicationController
<<<<<<< HEAD
  def show
    @question = Question.find(params[:id])
    @user = current_user
    @user_answer = UserAnswer.new
  end
=======
>>>>>>> master
end
