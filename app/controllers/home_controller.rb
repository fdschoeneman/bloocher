class HomeController < ApplicationController

  def index
    @page_title = "home"
    @user = User.new
  end
end
