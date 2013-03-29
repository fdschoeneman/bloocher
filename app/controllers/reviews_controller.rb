class ReviewsController < ApplicationController
  
  before_filter :authenticate_user!, except: [:create, :index, :show]  
  before_filter :authenticate_or_create!, only: :create

  def index

    @page_title = "Blooches"
    @reviews = Review.order(:rating).page params[:page]

    respond_to do |format|
      format.html 
      format.json { render json: @reviews }
    end
  end

  def show

    @review = Review.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @review }
    end
  end

  def new

    @review = Review.new
    @wine = Wine.find( params[:wine] )
    
    respond_to do |format|
      format.html 
      format.json { render json: @review }
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
    
    @review = Review.create(wine_id: params[:review][:wine_id], 
                            content: params[:review][:content], 
                            reviewer_id: @user.id)

    respond_to do |format|

      if @review.save
        format.html { redirect_to wine_path(@review.wine_id), notice: 'Review was successfully created.' }
        format.json { render json: @review.wine_id, status: :created, location: @review.wine }
      else
        format.html { render action: "new" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    @review = Review.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to wine_path(@review.wine_id), notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    @review = Review.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url }
      format.json { head :no_content }
    end
  end

private

  def bloochinate
  
  end

  def authenticate_or_create!

    if current_user.nil? && params[:review][:user][:email].blank?
      redirect_to :new_user_session, notice: "Please login"
      return
    elsif current_user
      @user = current_user
    elsif params[:review][:user]
      @user = User.find_or_create_by_email(params[:review][:user][:email])
    end   
  end
end
