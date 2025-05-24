class UsersController < ApplicationController
  def index
    Rails.logger.debug "Users query: #{User.all.to_sql}"
    @users = User.all
  end
end
