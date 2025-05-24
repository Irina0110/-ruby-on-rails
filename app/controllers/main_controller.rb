class MainController < ApplicationController
  before_action :authenticate_user!, only: [ :index ]

  def index
    @hotels = Hotel.all
  end

  def help
  end

  def contacts
  end

  def about
  end
end
