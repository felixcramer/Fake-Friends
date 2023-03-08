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
      redirect_to enter_room_path
    else
      redirect_to room_path(@room)
    end
  end
end
