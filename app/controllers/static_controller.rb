class StaticController < ApplicationController

  layout false, only: :index
  
  def home
    
    @page_title = "home"
    @user = User.new
  end

  def about
    
    @page_title = "about"
    @user = User.new
  end

  def terms
    
    @page_title = "terms of use"
    @user = User.new
  end

  def privacy
    
    @page_title = "privacy"
    @user = User.new
  end

  def help
    
    @page_title = "help"
    @user = User.new
  end

  def index

  end
end
