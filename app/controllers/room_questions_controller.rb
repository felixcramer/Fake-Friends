class RoomQuestionsController < ApplicationController
  def show
    @users = User.all
    @room = Room.find(params[:room_id])
    @room_question = RoomQuestion.find(params[:id])

    if @room_question.question.round == 1
      @room_questions = @room_question.room.room_questions
      @array_of_urls = []
      @room_questions.each do |question|
        @array_of_urls << room_room_question_path(question.room, question)
      end
      @answer = Answer.new
    end

    if @room_question.question.round == 2
      @user_answers = UserAnswer.where(room_id: @room)
    end
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

    if @room_question.question.round == 2
      @right_answer = @room_question.answers[0]
      @user = current_user
      @picked_users = []
      @array_of_ids = params[:room_question][:answer_ids]
      @array_of_ids.delete_at(0)
      @array_of_ids.each do |number|
        user_from_form = User.find(number)
        @picked_users << user_from_form
      end
      @picked_users.each do |u|
        user_answers_in_room = UserAnswer.where(room_id: @room, user_id: u)
        user_answers_in_room.each do |a|
          if a.answer.content == @right_answer.content
            raise
          else
            raise
          end 
        end
      end
    end 
  end

  private

  def user_answers_params
    params.require(:answers).permit(:room_question)
  end
end
