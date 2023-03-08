class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :informations]

  def home
  end

  def informations
  end
end
