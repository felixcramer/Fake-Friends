class RoomQuestionsController < ApplicationController
  def show
    @room_question = RoomQuestion.find(params[:id])
  end 
end
