class AddListecourseToDose < ActiveRecord::Migration[5.2]
  def change
    add_reference :doses, :listecourse, foreign_key: true
  end
end
