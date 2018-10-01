class CreateListecourses < ActiveRecord::Migration[5.2]
  def change
    create_table :listecourses do |t|
      t.text :doses
      t.references :semaine, foreign_key: true

      t.timestamps
    end
  end
end
