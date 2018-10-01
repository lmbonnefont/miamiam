class Semaine < ApplicationRecord
  belongs_to :user
  has_many :jours
  has_many :listecourse
end
