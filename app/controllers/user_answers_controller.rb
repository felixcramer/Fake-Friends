class UserAnswersController < ApplicationController
  def create
    @done_answer = @user_answer
    @done_answer.save
  end
end
