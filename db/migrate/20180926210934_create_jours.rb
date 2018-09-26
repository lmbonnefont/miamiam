class CreateJours < ActiveRecord::Migration[5.2]
  def change
    create_table :jours do |t|
      t.references :semaine, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
