class Semaine < ApplicationRecord
  belongs_to :user
  has_many :jours
end
