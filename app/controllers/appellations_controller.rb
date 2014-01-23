class AppellationsController < ApplicationController

  def index

    @appellations = Appellation.all

    respond_to do |format|
      format.html
      format.json { render json: @appellations }
    end
  end

  def show

    @appellation = Appellation.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @appellation }
    end
  end

  def new

    @appellation = Appellation.new

    respond_to do |format|
      format.html
      format.json { render json: @appellation }
    end
  end

  def edit

    @appellation = Appellation.find(params[:id])
  end

  def create

    @appellation = Appellation.new(params[:appellation])

    respond_to do |format|
      if @appellation.save
        format.html { redirect_to @appellation, notice: 'Appellation was successfully created.' }
        format.json { render json: @appellation, status: :created, location: @appellation }
      else
        format.html { render action: "new" }
        format.json { render json: @appellation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    @appellation = Appellation.find(params[:id])

    respond_to do |format|
      if @appellation.update_attributes(params[:appellation])
        format.html { redirect_to @appellation, notice: 'Appellation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appellation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    @appellation = Appellation.find(params[:id])
    @appellation.destroy

    respond_to do |format|
      format.html { redirect_to appellations_url }
      format.json { head :no_content }
    end
  end
end
