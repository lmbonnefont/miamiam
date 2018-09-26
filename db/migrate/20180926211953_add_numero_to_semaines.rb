class AddNumeroToSemaines < ActiveRecord::Migration[5.2]
  def change
    add_column :semaines, :numero, :integer
  end
end
