class Recette < ApplicationRecord
  # belongs_to :jour
  has_many :doses
  mount_uploader :photo, PhotoUploader
end
