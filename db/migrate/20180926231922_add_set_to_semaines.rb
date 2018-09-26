class AddSetToSemaines < ActiveRecord::Migration[5.2]
  def change
    add_column :semaines, :set, :boolean, default: false
  end
end
