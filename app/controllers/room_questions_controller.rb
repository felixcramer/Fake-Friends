class RoomQuestionsController < ApplicationController
  def show
    @room_question = RoomQuestion.find(params[:id])
  end

  def create
    @first_user_a = RoomQuestion.new(user: current_user, answer: params[:user_answer][:answer])
    @first_user_a.save
  end

  private

  def user_answers_params
    params.require(:user_answers).permit(:answer_id)
  end
end
