class CertificationsController < ApplicationController

  def index
    @certifications = Certification.all

    respond_to do |format|
      format.html
      format.json { render json: @certifications }
    end
  end

  def show
    @certification = Certification.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @certification }
    end
  end

  def new
    @certification = Certification.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @certification }
    end
  end

  def edit
    @certification = Certification.find(params[:id])
  end

  def create
    @certification = Certification.new(params[:certification])

    respond_to do |format|
      if @certification.save
        format.html { redirect_to @certification, notice: 'Certification was successfully created.' }
        format.json { render json: @certification, status: :created, location: @certification }
      else
        format.html { render action: "new" }
        format.json { render json: @certification.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @certification = Certification.find(params[:id])

    respond_to do |format|
      if @certification.update_attributes(params[:certification])
        format.html { redirect_to @certification, notice: 'Certification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @certification.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @certification = Certification.find(params[:id])
    @certification.destroy

    respond_to do |format|
      format.html { redirect_to certifications_url }
      format.json { head :no_content }
    end
  end
end
