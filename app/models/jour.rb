class Jour < ApplicationRecord
  belongs_to :semaine
  has_one :recette
end
