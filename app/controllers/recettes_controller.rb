class RecettesController < ApplicationController
  def show
    @recette = Recette.find(params["id"])
    @doses = @recette.doses
  end

  def index
    @recettes = Recette.all
  end

  def new
    @recette = Recette.new
  end

  def create
    recette = Recette.create!(recettes_params)
    redirect_to new_recette_dose_path(recette)
  end

  private

  def recettes_params
    params.require(:recette).permit(:nom, :nb_personne, :preparation, :cuisson, :difficulté, :instruction)
  end
end
