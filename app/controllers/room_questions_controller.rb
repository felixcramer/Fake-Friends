class RoomQuestionsController < ApplicationController
  def show
    @room_question = RoomQuestion.find(params[:id])
    @room_questions = @room_question.room.room_questions
    @array_of_urls = []
    @room_questions.each do |question|
      @array_of_urls << room_room_question_path(question.room, question)
    end
  end 
end
