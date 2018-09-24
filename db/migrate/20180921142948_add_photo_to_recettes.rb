class AddPhotoToRecettes < ActiveRecord::Migration[5.2]
  def change
    add_column :recettes, :photo, :string
  end
end
