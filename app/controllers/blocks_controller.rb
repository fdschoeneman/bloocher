class BlocksController < ApplicationController

  def index

    @page_title = "Blocks"
    @blocks = Vineyard.all

    respond_to do |format|
      format.html
      format.json { render json: @blocks }
    end
  end

  def show

    @block = Vineyard.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @block }
    end
  end

  def new

    @block = Vineyard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @block }
    end
  end

  def edit

    @block = Vineyard.find(params[:id])
  end

  def create

    @block = Vineyard.new(params[:block])

    respond_to do |format|
      if @block.save
        format.html { redirect_to @block, notice: 'Block was successfully created.' }
        format.json { render json: @block, status: :created, location: @block }
      else
        format.html { render action: "new" }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    @block = Vineyard.find(params[:id])

    respond_to do |format|
      if @block.update_attributes(params[:block])
        format.html { redirect_to @block, notice: 'Block was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    @block = Vineyard.find(params[:id])
    @block.destroy

    respond_to do |format|
      format.html { redirect_to blocks_url }
      format.json { head :no_content }
    end
  end
end
