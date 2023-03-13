class RoomQuestionsController < ApplicationController
  def show
    @users = User.all
    @room = Room.find(params[:room_id])
    @room_question = RoomQuestion.find(params[:id])
    @room_questions = @room_question.room.room_questions
    @array_of_urls = []
    @room_questions.each do |question|
      @array_of_urls << room_room_question_path(question.room, question)
    end

    @answer = Answer.new
  end 

  def create
  end

  def update
  @room = Room.find(params[:room_id])
  @room_question = RoomQuestion.find(params[:id])
  if @room_question.question.round == 1
    @new_answer = UserAnswer.new
    @new_answer.room = @room
    @new_answer.user = current_user
    @picked_answer = Answer.find(params[:room_question][:answer_ids][1])
    @new_answer.answer = @picked_answer
    @new_answer.save
    redirect_to room_room_question_path(@room, @room_question)
  end
  end

  private

  def user_answers_params
    params.require(:answers).permit(:room_question)
  end
end
