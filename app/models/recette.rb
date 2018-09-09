class Recette < ApplicationRecord
  belongs_to :semaine
  has_many :doses
end
