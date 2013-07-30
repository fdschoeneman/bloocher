class ShowcasesWinesController < ApplicationController

  before_action :set_showcase, only: [:show, :edit, :update, :destroy, :remove_wine]
  
  def create
    @showcase = Showcase.find(params[:showcase])
    # if current_user == @showcase.sommelier
      @showcase.showcase!(params[:wine])
      respond_to do |format|
        format.html { redirect_to @showcase, notice: "wine added" }
        format.json 
      end
    # end
  end

  def destroy

  end

  private

  def set_showcases_wine

    @showcases_wine = ShowcasesWine.find(params[:id])
  end

  def showcases_wine_params
    params.require(:showcases_wine).permit(:wine_id, :blurb_id, :showcase_id)
  end
end
