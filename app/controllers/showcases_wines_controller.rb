class ShowcasesWinesController < ApplicationController
  
  before_action :set_showcases_wine, only: [:update, :destroy]

  def create
    @showcase = Showcase.find(params[:showcase])
    @wine = Wine.friendly.find(params[:wine])
    # if current_user == @showcase.sommelier
      @showcase.showcase!(@wine.id)
      respond_to do |format|
        format.html { redirect_to @showcase, notice: "wine added" }
        format.json 
      end
    # end
  end

  def destroy

    @showcases_wine.destroy 

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

private

  def set_showcases_wine
    @showcases_wine = ShowcasesWine.find(params[:id])
  end
  
  def showcases_wine_params
    params.require(:showcases_wine).permit(:wine_id, :blurb_id, :showcase_id)
  end
end
