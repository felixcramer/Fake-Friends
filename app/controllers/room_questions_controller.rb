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

    if @room_question.round == 1
      @answer = Answer.new
    end

    if @room_question.round == 2
      @right_answer = Answer.where(room_question_id: @room_question)
      @user_answers = UserAnswer.where(room_id: @room)
      @room_users = RoomUser.where(room_id: @room)
      @right_collection = []
        @room_users.each do |user|
          if user.user != current_user
            @right_collection << user.user
          end
        end
      @array_of_usernames = []
      @right_collection.each do |user|
        @array_of_usernames << user.username
      end
    end
  end

  def create
  end

  def update
    @room = Room.find(params[:room_id])
    @room_question = RoomQuestion.find(params[:id])

    if @room_question.round == 1
      @new_answer = UserAnswer.new
      @new_answer.room = @room
      @new_answer.user = current_user
      @picked_answer = Answer.find(params[:room_question][:answer_ids])
      @new_answer.answer = @picked_answer
      @new_answer.save
    end

    if @room_question.round == 2
      @right_answer = Answer.where(room_question_id: @room_question)
      @picked_users = []
      @array_of_ids = params[:room_question][:answer_ids]
      @array_of_ids.delete_at(0)
      @array_of_ids.each do |number|
        user_from_form = User.find(number)
        @picked_users << user_from_form
      end
      @room_user = RoomUser.find_by(room_id: @room, user_id: current_user)
      @picked_users.each do |u|
        user_answers_in_room = UserAnswer.where(room_id: @room, user_id: u)
        user_answers_in_room.each do |user_answer|
          if user_answer.answer.question == @room_question.question
            if user_answer.answer.content == @right_answer.first.content
              @room_user.counter += 1
              @room_user.save
            else
              @room_user.counter -= 1
              @room_user.save
            end
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
