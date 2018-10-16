class Semaine < ApplicationRecord
  belongs_to :user
  has_many :jours
  has_many :listecourses
  has_many :recettes, through: :jours
end
