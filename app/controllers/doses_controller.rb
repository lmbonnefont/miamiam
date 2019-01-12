class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @recette = Recette.find(params[:recette_id])
  end

  def create
    dose = Dose.new(doses_params)
    recette = Recette.find(params[:recette_id])
    dose.recette = recette
    dose.save!
    redirect_to root_path
  end

  private

  def doses_params
    params.require(:dose).permit(:quantite, :ingredient, :unite)
  end

end
