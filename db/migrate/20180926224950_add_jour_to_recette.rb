class AddJourToRecette < ActiveRecord::Migration[5.2]
  def change
    add_reference :recettes, :jour, foreign_key: true
  end
end
