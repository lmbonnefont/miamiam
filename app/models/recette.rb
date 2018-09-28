class Recette < ApplicationRecord
  belongs_to :jour, optional: true
  has_many :doses
  mount_uploader :photo, PhotoUploader


  def self.lm
    recettes = Recette.all
    recettes.each do |recette|
      recette.deja_choisie = false
      recette.save!
    end
  end

end
