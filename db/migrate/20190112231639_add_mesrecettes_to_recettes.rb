class AddMesrecettesToRecettes < ActiveRecord::Migration[5.2]
  def change
    add_column :recettes, :mes_recettes, :boolean, default: false
  end
end
