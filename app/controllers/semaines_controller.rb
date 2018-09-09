class SemainesController < ApplicationController

  def create
    semaine = Semaine.create!(active: false, user: current_user)
    redirect_to root_path
  end

  def show
  end
end
