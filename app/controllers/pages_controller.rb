class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :informations]

  def home
  end

  def informations
  end

  def enter_room
  end

  def post_form
    @room = Room.find_by(room_code: params[:user][:name])

    if @room == nil
      flash[:alert] = "No rooms available for that room code!"
      redirect_to enter_room_path
    else
      if @room.room_users.length == 8
        flash[:alert] = "The room is full!"
        redirect_to enter_room_path
        raise
      else
        @room_user = RoomUser.new
        @room_user.room = @room
        @room_user.user = current_user
        @room_user.save
        redirect_to room_path(@room)
      end
    end
  end

  def creating_round
    @room = Room.find(params[:room_id])
    @questions_first = @room.room_questions
    @questions_first_cleaned = []
    @questions_first.each do |q|
      @questions_first_cleaned << q.question
    end
    @second_round = []

    ##### finding right answer from user to create question 

    @random_user = @room.users.sample
    raise
    # @random_user_all_answers = UserAnswer.where(user_id: @random_user)
    # @users_room_questions = []
    # @random_user_all_answers.each do |answer|
    #   @users_room_questions << answer.answer.question.room_questions
    # end
    # new_thing = []
    # @users_room_questions.each do |q|
    #   new_thing << q
    # end

    ##### creating new question after finding the right information

    # @questions_first_cleaned.each do |q|
    #   random_user.user_answers.each do |a|
    #     if q.id == a.answer.question_id
    #       new_question = Question.new(content: "Who likes #{a.answer.content}", round: 2)
    #       new_question.save
    #       @second_round << new_question
    #     end
    #   end
    # end

    ##### creating new room questions for starting second round

    #   @second_round.each do |q|
    #     room_question = RoomQuestion.new
    #     room_question.question = q
    #     room_question.room = @room
    #     room_question.save
    #   end
    # end
    # @room_questions = @room.room_questions
    # @room_questions_cleaned = []
    # @room_questions.each do |q|
    #   if q.question.round == 2
    #     @room_questions_cleaned << q.question
    #   end
    # end
  end


  def ranking
    # transitory content for first demo day:
    @users = User.all
  end
end
