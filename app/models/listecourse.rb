class Listecourse < ApplicationRecord
  belongs_to :semaine
  has_many :doses
end
