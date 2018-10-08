class SemainesController < ApplicationController

  def create
    semaine = Semaine.create!(active: false, user: current_user)
    redirect_to root_path
  end

  def show
    @semaine = Semaine.where(numero: Time.now.strftime('%W').to_i)[0] #on sélectionne la semaine en cours
    @semaine = Semaine.find(2)
    @jours = @semaine.jours
    @listecourse = @semaine.listecourse[0]

    if @semaine.set == false
      @recette = Recette.where(deja_choisie: false)
      @selected = @recette.sample(7)

      for i in (0..6)
        @selected[i].jour = @jours[i]
        @selected[i].deja_choisie = true
        @selected[i].save!

        @selected[i].doses.each do |dose|
          dose.listecourse = @listecourse
          dose.save!
        end
      end
      @semaine.set = true
      @semaine.save!
    end
  end

end
