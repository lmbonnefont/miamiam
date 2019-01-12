class RecettesController < ApplicationController
  def show
    @recette = Recette.find(params["id"])
    @doses = @recette.doses
  end

  def index
    @recettes_chef = Recette.where(mes_recettes: false)
    @recettes_persos = Recette.where(mes_recettes: true)

  end

  def new
    @recette = Recette.new
  end

  def create
    recette = Recette.new(recettes_params)
    recette.mes_recettes = true
    recette.save
    redirect_to new_recette_dose_path(recette)
  end

  private

  def recettes_params
    params.require(:recette).permit(:nom, :nb_personne, :preparation, :cuisson, :difficulté, :instruction, :photo)
  end
end
