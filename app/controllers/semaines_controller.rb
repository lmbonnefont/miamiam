class SemainesController < ApplicationController

  def create
    semaine = Semaine.create!(active: false, user: current_user)
    redirect_to root_path
  end


  def show

    @semaine = Semaine.where(numero: Time.now.strftime('%W').to_i)[0] #on sélectionne la semaine en cours
    @semaine = Semaine.first
    @jours = @semaine.jours
    @listecourse = @semaine.listecourses[0]


    if @semaine.set == false
      @recette = Recette.where(deja_choisie: false)
      @selected = @recette.sample(@semaine.nbjour)

      for i in (1..@semaine.nbjour)
        @selected[i-1].jour = @jours[i-1]
        @selected[i-1].deja_choisie = true
        @selected[i-1].save!

        @selected[i-1].doses.each do |dose|
          dose.listecourse = @listecourse
          dose.save!
        end
      end
      @semaine.set = true
      @semaine.save!
    end
  end

  def nbjours
    @semaine = Semaine.new
  end

  def savenbjours
    semaine = Semaine.where(numero: Time.now.strftime('%W').to_i)[0]
    semaine.nbjour = params["semaine"]["nbjour"].to_i
    semaine.set = false
    semaine.save!

    recettes = semaine.recettes
    recettes.each do |recette|
      recette.jour = nil
      recette.doses.each do |dose|
        dose.update(listecourse: nil)
      end
      recette.save!
    end

    redirect_to semaine_path(Semaine.first)
  end

  private

  def semaine_params
    params.require(:semaine).permit(:nbjour)
  end

end
