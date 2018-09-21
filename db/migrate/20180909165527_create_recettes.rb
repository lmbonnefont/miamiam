class CreateRecettes < ActiveRecord::Migration[5.2]
  def change
    create_table :recettes do |t|
      t.string :nom
      t.text :instruction
      t.integer :nb_personne
      t.boolean :deja_choisie, default: false
      t.date :date
      t.references :semaine, foreign_key: true

      t.timestamps
    end
  end
end
