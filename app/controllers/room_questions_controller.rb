class RoomQuestionsController < ApplicationController
  def show
    @users = User.all
    @room = Room.find(params[:room_id])
    @room_question = RoomQuestion.find(params[:id])

    # Data to be transfered to the change_page Stimulus controller
    @room_questions = @room_question.room.room_questions
    @array_of_urls = @room_questions.map { |question| questions = room_room_question_path(question.room, question) }

    if @room_question.round == 1
      @answer = Answer.new
    end

    if @room_question.round == 2
      # There is only one answer stored in the room_question and is
      # the answer of a random user of the same question on the first round
      @right_answer = Answer.where(room_question_id: @room_question)

      # All users answers on the room for that question, this need is for
      # creating the simple form with users as answers for the second round
      @user_as_answers = []
      RoomUser.where(room_id: @room).each do |room_user|
        # The user shouldn't see himself appearing on the form
        if room_user.user != current_user
          @user_as_answers << room_user.user
        end
      end

      # Data to be transfered to the add_username Stimulus controller
      @user_as_answers_usernames = @user_as_answers.map { |user| user.username }
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
