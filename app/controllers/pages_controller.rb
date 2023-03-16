class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :informations]

  def home
  end

  def informations
  end

  def your_games
    @user = current_user
    @user_as_room_users = RoomUser.where(user_id: @user)
    @rooms_where_user_played = []
    @user_as_room_users.each do |user|
      @rooms_where_user_played << user.room
    end
  end

  def enter_room
  end

  def post_form
    @room = Room.find_by(room_code: params[:user][:name])

    if @room == nil
      flash[:alert] = "No rooms available for that room code!"
      redirect_to enter_room_path
    else
      if @room.room_users.length == 6
        flash[:alert] = "The room is full!"
        redirect_to enter_room_path
      else
        @room_user = RoomUser.new
        @room_user.room = @room
        @room_user.user = current_user
        @room_user.counter = 10
        @room_user.save
        WaitingRoomChannel.broadcast_to(
          @room,
          render_to_string(
            partial: "waiting_rooms/waiting_room"
            # locals: { @room }
          )
        )
        redirect_to room_path(@room)
      end
    end
  end

  def creating_round
    @room = Room.find(params[:room_id])
  end

  def post_round
    @room = Room.find(params[:room_id])
    @room_questions = @room.room_questions
    if current_user == @room.user

      @room_questions.each do |q|
        @random_user = @room.users.sample
        @right_answers = UserAnswer.where(room_id: @room, user_id: @random_user)
        @right_answers.each do |a|
          if q.question == a.answer.question
            q.round = 2
            q.save!
            new_answer = Answer.new(content: a.answer.content)
            new_answer.room_question = q
            new_answer.save
          end
        end
      end
      @room_question = @room_questions.first
      redirect_to room_room_question_path(@room, @room_question)
    else
      if @room.room_questions[0].round == 1
        flash[:alert] = "Only the host can start the round!"
        redirect_to room_creating_round_path
      else
        @room_question = @room_questions.first
        redirect_to room_room_question_path(@room, @room_question)
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
end
