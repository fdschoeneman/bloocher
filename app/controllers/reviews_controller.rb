class ReviewsController < ApplicationController

  def index
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
      format.html # new.html.erb
      format.json { render json: @review }
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
    
    @review = Review.new(params[:review])

    if current_user
      @review.reviewer = current_user
    end

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review.wine, notice: 'Review was successfully created.' }
        format.json { render json: @review.wine, status: :created, location: @review.wine }
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
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
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
end
