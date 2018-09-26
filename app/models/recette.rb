class Recette < ApplicationRecord
  belongs_to :jour, optional: true
  has_many :doses
  mount_uploader :photo, PhotoUploader
end
