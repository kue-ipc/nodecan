class HomeController < ApplicationController
  def index
    authorize current_user, :user?
  end
end
