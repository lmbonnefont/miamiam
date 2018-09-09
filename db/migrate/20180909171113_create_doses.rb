class CreateDoses < ActiveRecord::Migration[5.2]
  def change
    create_table :doses do |t|
      t.string :ingredient
      t.float :quantite
      t.string :unite
      t.references :recette, foreign_key: true

      t.timestamps
    end
  end
end
