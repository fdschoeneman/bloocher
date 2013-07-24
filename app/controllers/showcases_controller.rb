class ShowcasesController < ApplicationController
  before_action :set_showcase, only: [:show, :edit, :update, :destroy]

  # GET /showcases
  # GET /showcases.json
  def index
    @showcases = Showcase.all
  end

  # GET /showcases/1
  # GET /showcases/1.json
  def show
  end

  # GET /showcases/new
  def new
    @showcase = Showcase.new
  end

  # GET /showcases/1/edit
  def edit
  end

  # POST /showcases
  # POST /showcases.json
  def create
    @showcase = Showcase.new(showcase_params)

    respond_to do |format|
      if @showcase.save
        format.html { redirect_to @showcase, notice: 'Showcase was successfully created.' }
        format.json { render action: 'show', status: :created, location: @showcase }
      else
        format.html { render action: 'new' }
        format.json { render json: @showcase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /showcases/1
  # PATCH/PUT /showcases/1.json
  def update
    respond_to do |format|
      if @showcase.update(showcase_params)
        format.html { redirect_to @showcase, notice: 'Showcase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @showcase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /showcases/1
  # DELETE /showcases/1.json
  def destroy
    @showcase.destroy
    respond_to do |format|
      format.html { redirect_to showcases_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_showcase
      @showcase = Showcase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def showcase_params
      params.require(:showcase).permit(:showcaseable_id, :showcaseable_type, :version, :name, :description, :published)
    end
end
