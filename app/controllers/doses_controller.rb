class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @recette = Recette.find(params[:recette_id])
  end

  def create

  end

  def doses_params
    params.require(:doses).permit(:quantite, :ingredient, :unite)
  end
end
