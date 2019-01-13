class AddDosesparamsToRecettes < ActiveRecord::Migration[5.2]
  def change
    add_column :recettes, :nb_doses, :integer
    add_column :recettes, :nb_doses_created, :integer, default: 0
  end
end
