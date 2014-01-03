class CertifyingBodiesController < ApplicationController
  before_action :set_certifying_body, only: [:show, :edit, :update, :destroy]

  # GET /certifying_bodies
  def index
    @certifying_bodies = CertifyingBody.all
  end

  # GET /certifying_bodies/1
  def show
  end

  # GET /certifying_bodies/new
  def new
    @certifying_body = CertifyingBody.new
  end

  # GET /certifying_bodies/1/edit
  def edit
  end

  # POST /certifying_bodies
  def create
    @certifying_body = CertifyingBody.new(certifying_body_params)

    if @certifying_body.save
      redirect_to @certifying_body, notice: 'Certifying body was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /certifying_bodies/1
  def update
    if @certifying_body.update(certifying_body_params)
      redirect_to @certifying_body, notice: 'Certifying body was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /certifying_bodies/1
  def destroy
    @certifying_body.destroy
    redirect_to certifying_bodies_url, notice: 'Certifying body was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_certifying_body
      @certifying_body = CertifyingBody.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def certifying_body_params
      params.require(:certifying_body).permit(:name, :mission, :url)
    end
end
