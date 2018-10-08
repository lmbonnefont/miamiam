class ListedecoursesController < ApplicationController
  def show
    semaine = Semaine.find(params["semaine_id"])
    @listecourse = semaine.listecourse[0]
  end
end
