class Listecourse < ApplicationRecord
  belongs_to :semaine
  serialize :doses,Array
end
