class ListedecoursesController < ApplicationController
  def show
    semaine = Semaine.find(params["semaine_id"])
    @listecourse = semaine.listecourse[0]
    @notdisplayed = ["sel", "poivre."]
    @h = matching(@listecourse.doses)
  end

  private

  def matching(hash_doses)
    h = {}
    hash_doses.each do |dose|
      if h[dose.ingredient] == nil
        h[dose.ingredient] = dose.quantite
      else
        h[dose.ingredient] = h[dose.ingredient] + dose.quantite
      end
    end
    return h
  end

end
