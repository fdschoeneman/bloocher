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

    if params[:review][:content]
      
      content = params[:review][:content]
    else
      
      content = bloochinate(params[:review][:blooch])
    end
  
    @review = Review.create(wine_id: params[:review][:wine_id], 
                            content: content, 
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

  def bloochinate(params)
     
    adjective_1 = params[:adjective_1].titleize
    intmodifier = params[:intmodifier]
    adjective_2 = params[:adjective_2]
    wine_category = params[:wine_category]
    flavor_1 = params[:flavor_1]
    strength = params[:strength]
    flavor_2 = params[:flavor_2]
    pair_setup = params[:pair_setup]
    food = params [:food]
    drink_after = params[:drink_after]
    drink_before = params[:drink_before]
    
    intro = adjective_1.capitalize + ", " + intmodifier + " " + adjective_2 + " " 
    wine_category = wine_category + ".  "
    flavors = flavor_1.capitalize + ", " + strength + " " + flavor_2 + ".  "
    pairing = pair_setup.capitalize + " " + food + ".  "
    laydown = "Drink between " + drink_after + " and " + drink_before + "."
    intro + wine_category + flavors + pairing + laydown
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
