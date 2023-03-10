class RoomQuestionsController < ApplicationController
  def show
    @room = Room.find(params[:room_id])
    @room_question = RoomQuestion.find(params[:id])
    @room_questions = @room_question.room.room_questions
    @array_of_urls = []
    @room_questions.each do |question|
      @array_of_urls << room_room_question_path(question.room, question)
    end
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
