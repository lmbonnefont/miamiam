class CreateListecourses < ActiveRecord::Migration[5.2]
  def change
    create_table :listecourses do |t|
      t.references :semaine, foreign_key: true

      t.timestamps
    end
  end
end
