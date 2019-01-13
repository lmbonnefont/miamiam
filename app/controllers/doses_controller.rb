class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @recette = Recette.find(params[:recette_id])
  end

  def create
    dose = Dose.new(doses_params)
    recette = Recette.find(params[:recette_id])
    recette.nb_doses_created += 1
    recette.save

    dose.recette = recette
    dose.save!

    if recette.nb_doses_created == recette.nb_doses
      redirect_to recette_path(recette)
    else
      redirect_to new_recette_dose_path(recette)
    end
  end

  private

  def doses_params
    params.require(:dose).permit(:quantite, :ingredient, :unite)
  end

end
