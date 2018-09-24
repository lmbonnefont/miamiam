class RecettesController < ApplicationController
  def show
  end

  def index
    @recettes = Recette.all
  end
end
