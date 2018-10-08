class Dose < ApplicationRecord
  belongs_to :recette
  belongs_to :listecourse
end
