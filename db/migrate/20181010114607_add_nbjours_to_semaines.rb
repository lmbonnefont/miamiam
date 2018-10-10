class AddNbjoursToSemaines < ActiveRecord::Migration[5.2]
  def change
    add_column :semaines, :nbjour, :integer, default: 5
  end
end
