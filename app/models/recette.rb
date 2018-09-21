class Recette < ApplicationRecord
  #belongs_to :semaine
  has_many :doses
  mount_uploader :photo, PhotoUploader
end
