class CreateSemaines < ActiveRecord::Migration[5.2]
  def change
    create_table :semaines do |t|
      t.boolean :active, default: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
