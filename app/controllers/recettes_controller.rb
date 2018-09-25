class RecettesController < ApplicationController
  def show
    @recette = Recette.find(params["id"])
    @doses = @recette.doses
  end

  def index
    @recettes = Recette.all
  end
end
