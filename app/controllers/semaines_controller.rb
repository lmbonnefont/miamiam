class SemainesController < ApplicationController

  def create
    semaine = Semaine.create!(active: false, user: current_user)
    redirect_to root_path
  end

  def show
    @semaine = Semaine.where(numero: Time.now.strftime('%W').to_i)[0]
    @jours = @semaine.jours
    @recette = Recette.where(deja_choisie: false)
    @selected = @recette.sample(7)
    for i in (0..6)
      @selected[i].jour = @jours[i]
      @selected[i].deja_choisie = true
      @selected[i].save!
    end
  end

  def randomrepartition

    redirect_to semaine_path(@semaine)
  end

end
