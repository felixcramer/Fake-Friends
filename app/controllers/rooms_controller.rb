class RoomsController < ApplicationController
  def index
    @user = current_user
    user_as_room_user = RoomUser.where(user_id: @user)
    @all_rooms_where_user_played = user_as_room_user.map { |user| user.room }
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user
    # Generating four digit random code to be used as password for
    # the room
    @room.room_code = 4.times.map{rand(10)}.join
    if @room.save
      # Pulling the hard-coded questions from the seeds file and storing
      # them in the room we just created as "room_questions" (joining table)
      @questions = Question.where(round: 1)
      @questions.each do |question|
        @room_question = RoomQuestion.new
        @room_question.question = question
        @room_question.room = @room
        @room_question.round = 1
        @room_question.save
      end
      @room_user = RoomUser.new
      @room_user.room = @room
      @room_user.user = current_user
      # Setting the counter as 10 for users not to have negative points
      # at the end of the game
      @room_user.counter = 10
      @room_user.save
      redirect_to room_path(@room)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new_round
    @room = Room.find(params[:room_id])
  end

  def create_round
    @room = Room.find(params[:room_id])
    @room_questions = @room.room_questions

    # Checking if user is the host of the room because only the host
    # can create the second round
    if current_user == @room.user
      @room_questions.each do |question|
        # Selecting answer random user and getting his answers
        # for the room
        @random_user_all_answers_in_room = UserAnswer.where(room_id: @room, user_id: @room.users.sample)
        # Findind the answer of the user for the current question
        @random_user_all_answers_in_room.each do |answer|
          if question.question == answer.answer.question
            question.round = 2
            question.save!
            # Setting the answer as the right answer of the room
            right_answer = Answer.new(content: answer.answer.content, plural: answer.answer.plural)
            right_answer.room_question = question
            right_answer.save
          end
        end
      end

      redirect_to room_room_question_path(@room, @room_questions.first)
    else
      if @room.room_questions[0].round == 1
        flash[:alert] = "Only the host can start the round!"
        redirect_to room_new_round_path
      else
        redirect_to room_room_question_path(@room, @room_questions.first)
      end
    end
  end

  def ranking
    @room = Room.find(params[:room_id])
    @room_users_by_ranking = RoomUser.where(room_id: @room).order(counter: :desc)
    @winner = @room_users_by_ranking.first
    @fakefriend = @room_users_by_ranking.last
    RankingChannel.broadcast_to(
      @room,
      render_to_string(
        partial: "shared/ranking_room",
        locals: { winner: @winner, fakefriend: @fakefriend }
      )
    )
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
